{
  description = "DnD Homebrew Content";

  inputs = {
    nixpkgs = {
      type = "github";
      owner = "NixOS";
      repo = "nixpkgs";
      ref = "nixpkgs-unstable";
    };
  };

  outputs = { self, nixpkgs }: {

    packages.x86_64-linux.default =
      with import nixpkgs { system = "x86_64-linux"; };
      stdenv.mkDerivation {
        name = "dnd-homebrew";
        src = ./.;
      
        makeFlags = [ "PREFIX=$(out)" ];
      
        buildInputs = [
          texlive.combined.scheme-full
          biber
        ];
      };

    devShells.x86_64-linux.default =
      with import nixpkgs { system = "x86_64-linux"; };
      mkShell {
        buildInputs = with pkgs; [
          ((callPackage self.packages.x86_64-linux.default {}).buildInputs)
        ];
      };

  };
}
