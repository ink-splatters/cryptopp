with import <nixpkgs> {} ;

mkShell.override { stdenv = gcc12Stdenv ; } {

	nativeBuildInputs = [
		gcc
		gnumake

	];
	CFLAGS="-march native -mcpu=native -O3 -flto";
	hardeningDisable = [ "all" ];
}