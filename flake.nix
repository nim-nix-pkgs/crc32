{
  description = ''CRC32, 2 proc, copied from RosettaCode.'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."crc32-master".dir   = "master";
  inputs."crc32-master".owner = "nim-nix-pkgs";
  inputs."crc32-master".ref   = "master";
  inputs."crc32-master".repo  = "crc32";
  inputs."crc32-master".type  = "github";
  inputs."crc32-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."crc32-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib"];
  in lib.mkProjectOutput {
    inherit self nixpkgs;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
    refs = builtins.removeAttrs inputs args;
  };
}