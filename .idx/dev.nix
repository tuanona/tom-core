{ pkgs, ... }: {
  # Channel configuration
  channel = "stable-24.05";

  # Essential packages
  packages = [
    pkgs.rustup
    pkgs.pkg-config    # Added for build dependencies
    pkgs.openssl       # Common dependency for Rust projects
    pkgs.stdenv.cc     # C compiler toolchain
    pkgs.sqlite        # For database support
  ];

  # Environment variables
  env = {
    RUST_SRC_PATH = "${pkgs.rustPlatform.rustLibSrc}";
    RUSTUP_HOME = "$HOME/.rustup";
    CARGO_HOME = "$HOME/.cargo";
  };
  # Enable Docker service
  services.docker.enable = true;

  # IDX configuration
  idx = {
    # Development extensions
    extensions = [
      "rust-lang.rust-analyzer"
      "tamasfe.even-better-toml"
      "serayuzgur.crates"
      "vadimcn.vscode-lldb"
      "qwtel.sqlite-viewer"
      "ms-azuretools.vscode-docker"
    ];

    workspace = {
      onCreate = {
        # Setup Rust toolchain
        setup-rust = ''
          rustup install stable
          rustup default stable
          rustup component add rustfmt clippy rust-src rust-analysis
        '';
        
        # Default files to open
        default.openFiles = ["src/main.rs"];
      };

      # Verify Rust setup on workspace start
      onStart = {
        check-rust = "rustup show";
      };
    };

    # Preview configuration (can be expanded as needed)
    previews = {};
  };

}
