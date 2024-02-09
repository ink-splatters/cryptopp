with import <nixpkgs> {} ;

mkShell.override { stdenv = llvmPackages_latest.stdenv ; } {

	nativeBuildInputs = with llvmPackages_latest;[
		clang
		llvm
		gnumake
		lld
		libtool
	];
	CFLAGS="-march=apple-m1 -mcpu=apple-m1   -mfpu=neon -mfloat-abi=hard -O3 -mllvm -vectorize-loops -flto -fprofile-generate   -fuse-ld=lld";
	CXXFLAGS="-march=apple-m1 -mcpu=apple-m1   -mfpu=neon -mfloat-abi=hard -O3 -mllvm -vectorize-loops -flto -fprofile-generate   -fuse-ld=lld";

	hardeningDisable = [ "all" ];
}
