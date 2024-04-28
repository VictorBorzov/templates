{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };
  
  outputs = { self, nixpkgs }:
    {
      templates = {
        aspnet = {
          path = ./templates/aspnet;
          description = "Dotnet web application template";
        };
        dotnet = {
          path = ./templates/dotnet;
          description = "Dotnet application template";
        };
      };
    };
}
