{
  description = "Rust app build";
  inputs = { nixpkgs.url = "nixpkgs/nixos-unstable"; };
  outputs = { self, nixpkgs }:
    let pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in {
      packages.x86_64-linux.default = pkgs.rustPlatform.buildRustPackage {
        pname = "app_name";
        version = "0.1.0";
        src = ./.;

        cargoLock = { lockFile = ./Cargo.lock; };
      };
    };
}
