{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: {
    templates = {
      dotnet = {
        path = ./templates/dotnet;
        description = "Dotnet application template";
      };
      rust = {
        path = ./templates/rust;
        description = "Rust application template";
      };
      helix = {
        path = ./templates/helix;
        description = "Helix workspace template";
      };
    };
  };
}
