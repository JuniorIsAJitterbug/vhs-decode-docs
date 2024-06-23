{
  description = "mkdocs dev flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    devenv.url = "github:cachix/devenv";
    nixpkgs-python.url = "github:cachix/nixpkgs-python";

  };

  nixConfig = {
    extra-trusted-public-keys = [
      "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
      "nixpkgs-python.cachix.org-1:hxjI7pFxTyuTHn2NkvWCrAUcNZLNS3ZAvfYNuYifcEU="
    ];
    extra-substituters = [
      "https://devenv.cachix.org"
      "https://nixpkgs-python.cachix.org"
    ];
  };

  outputs = inputs@{ flake-parts, nixpkgs, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.devenv.flakeModule
      ];

      systems = [ "x86_64-linux" ];

      perSystem = { config, self', inputs', pkgs, lib, system, ... }:
        {
          devenv.shells = {
            default = {
              languages.python = {
                enable = true;
                version = "3.10";

                poetry = {
                  enable = true;
                  activate.enable = true;
                  install.enable = true;
                  install.allExtras = true;
                };
              };
            };
          };
        };
    };
}
