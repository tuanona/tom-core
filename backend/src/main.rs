use actix_cors::Cors;
use actix_web::{web, App, HttpResponse, HttpServer, Responder};
use serde::{Deserialize, Serialize};
use std::sync::Mutex;

#[derive(Serialize, Deserialize, Clone)]
struct PlayerPosition {
    x: f32,
    y: f32,
}

struct GameState {
    player_position: Mutex<PlayerPosition>,
}

async fn get_position(data: web::Data<GameState>) -> impl Responder {
    let position = data.player_position.lock().unwrap();
    HttpResponse::Ok().json(&*position)
}

async fn update_position(
    data: web::Data<GameState>,
    new_position: web::Json<PlayerPosition>,
) -> impl Responder {
    let mut position = data.player_position.lock().unwrap();
    *position = new_position.into_inner();
    HttpResponse::Ok().json(&*position)
}

// Added a simple health check endpoint
async fn health_check() -> impl Responder {
    HttpResponse::Ok().body("Server is running!")
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    let game_state = web::Data::new(GameState {
        player_position: Mutex::new(PlayerPosition { x: 0.0, y: 0.0 }),
    });

    println!("Server starting at http://127.0.0.1:8080");

    HttpServer::new(move || {
        let cors = Cors::default()
            .allow_any_origin()
            .allow_any_method()
            .allow_any_header();

        App::new()
            .wrap(cors)
            .app_data(game_state.clone())
            .route("/", web::get().to(health_check))
            .route("/position", web::get().to(get_position))
            .route("/position", web::post().to(update_position))
    })
    .bind("127.0.0.1:8080")?
    .run()
    .await
}