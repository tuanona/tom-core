# tom-server/dev.nix
{ pkgs, ... }: {
  channel = "stable-24.05";
  
  packages = [
    # Frontend dependencies
    pkgs.nodejs_20
    pkgs.yarn
    
    # Backend dependencies
    pkgs.cargo
    pkgs.rustc
    pkgs.rustfmt
    pkgs.stdenv.cc
  ];
  
  env = {
    RUST_SRC_PATH = "${pkgs.rustPlatform.rustLibSrc}";
  };
  
  idx = {
    extensions = [
      # Backend extensions
      "rust-lang.rust-analyzer"
      "tamasfe.even-better-toml"
      "serayuzgur.crates"
      "vadimcn.vscode-lldb"
    ];
    
    workspace = {
      onCreate = {
        npm-install = "cd frontend && npm ci --no-audit --prefer-offline --no-progress --timing";
        default.openFiles = [
          "frontend/src/App.tsx"
          "backend/src/main.rs"
        ];
      };
    };
    
    previews = {
      enable = true;
      previews = {
        frontend = {
          command = ["cd" "frontend" "&&" "npm" "run" "dev" "--" "--port" "$PORT" "--host" "0.0.0.0"];
          manager = "web";
        };
      };
    };
  };
}