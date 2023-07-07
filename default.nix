{ pkgs ? import
    (fetchTarball {
      name = "jacobi-2023-06-30";
      url = "https://nix.cobi.dev/x/0efe38955844d1ed78664ddbfbb5f44bd2bff0ae";
      sha256 = "07cx1rrmmbzj8mfgfavcm1nwnpfc1z9c9k5hn1246nf1qb1i88pg";
    })
    { }
}:
let
  name = "vue-quiz-obs";
  node = pkgs.nodejs_20;

  tools = with pkgs; {
    cli = [
      coreutils
      nixpkgs-fmt
    ];
    node = [ node ];
    npm = with node.pkgs; [ prettier ];
    scripts = [ ];
  };

  paths = pkgs.lib.flatten [ (builtins.attrValues tools) ];
in
pkgs.buildEnv {
  inherit name paths;
  buildInputs = paths;
}
