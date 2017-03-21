{ pkgs }:

rec {
  allowBroken = true;
  allowUnfree = true;
  allowUnfreeRedistributable = true;

  packageOverrides = pkgs : rec {
    hoverfly = pkgs.callPackage ./pkgs/development/tools/hoverfly {};
    scala-env = with pkgs; buildEnv {
      name = "scala-env";
      paths = [
            openjdk
            sbt
            scalafmt
      ];
    };
    erlang-env = with pkgs; buildEnv {
      name = "elrang-env";
      paths = [
            erlang
            elixir
      ];
    };
  };

}