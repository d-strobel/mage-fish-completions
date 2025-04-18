{
  description = "Fish completion for Magefiles";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
        };

        versionJson = builtins.fromJSON (builtins.readFile ./.release-please-manifest.json);
      in {
        devShells.default = with pkgs;
          mkShell {
            buildInputs = [
              pre-commit
              nodejs
              nodePackages.npm
              go
              mage
            ];

            shellHook = ''
              HOOK_PATH=$(git rev-parse --git-path hooks/pre-commit)
              if [ ! -f "$HOOK_PATH" ]; then
                echo "Setting up pre-commit hooks..."
                ${pkgs.pre-commit}/bin/pre-commit install
              fi
            '';
          };

        packages.default = pkgs.stdenv.mkDerivation {
          pname = "mage-fish-completion";
          version = versionJson.".";
          src = ./.;

          installPhase = ''
            mkdir -p $out
            cp mage.fish $out/mage.fish
          '';
        };
      }
    );
}
