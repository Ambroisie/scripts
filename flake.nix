{
  description = "Ambroisie's random scripts";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    futils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, futils } @ inputs:
    futils.lib.eachSystem futils.lib.allSystems (system:
      let
        inherit (nixpkgs) lib;
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShell = pkgs.mkShell {
          name = "scripts";
          buildInputs = with pkgs; [
            gitAndTools.pre-commit
            shellcheck
          ];
        };
      }
    );
}
