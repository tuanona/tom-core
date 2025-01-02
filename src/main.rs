use actix_cors::Cors;
use actix_web::{web, App, HttpResponse, HttpServer, Responder};
use actix_files as fs;
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

async fn health_check() -> impl Responder {
    HttpResponse::Ok().body("Server is running!")
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    let game_state = web::Data::new(GameState {
        player_position: Mutex::new(PlayerPosition { x: 0.0, y: 0.0 }),
    });

    println!("Server starting on port 2000");

    HttpServer::new(move || {
        let cors = Cors::default()
            .allow_any_origin()
            .allowed_methods(vec!["GET", "POST", "OPTIONS"])
            .allowed_headers(vec!["Content-Type", "Authorization", "Accept"])
            .expose_headers(vec!["Access-Control-Allow-Origin"])
            .supports_credentials()
            .max_age(3600);

        App::new()
            .wrap(cors)
            .app_data(game_state.clone())
            .service(fs::Files::new("/static", "./static").index_file("index.html"))
            .route("/", web::get().to(health_check))
            .route("/position", web::get().to(get_position))
            .route("/position", web::post().to(update_position))
    })
    .bind("0.0.0.0:2000")?
    .run()
    .await
}