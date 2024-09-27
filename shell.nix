{ pkgs ? import <nixpkgs> { } }:

with pkgs;
mkShell {
  name = "vimux.nvim";
  buildInputs = [
    pkg-config
    stdenv.cc
    luajit
    autoconf
    automake
    libtool
    ncurses.dev
    libevent.dev
    bison
  ];
}
