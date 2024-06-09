{
  description = "Dotnet app build";

  inputs = { nixpkgs.url = "nixpkgs/nixos-unstable"; };

  outputs = { self, nixpkgs }:
    let pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in {
      packages.x86_64-linux.default = pkgs.buildDotnetModule {
        pname = "HelloWorld";
        version = "0.1";
        src = ./.;
        projectFile = "./HelloWorld.csproj";
        nugetDeps = ./deps.nix;
        dotnet-sdk = pkgs.dotnetCorePackages.dotnet_8.sdk;
        selfContainedBuild = true;
        dotnetFlags = [
          "-p:InvariantGlobalization=true"
          "-p:PublishTrimmed=true"
          "-p:PublishSingleFile=true"
          "-p:IncludeNativeLibrariesForSelfExtract=True"
          "-p:DebugType=None"
          "-p:DebugSymbols=False"
        ];
        executables = [ "HelloWorld" ];
      };
    };
}

