{ gcc8Stdenv, fetchgit, pkgconfig, boost, cmake, curl, gcc8, git }:
let
  boostpkg = boost.override {
    enableStatic = true;
  };
  stdenv = gcc8Stdenv;
in stdenv.mkDerivation rec {
  name = "cacos";

  src = fetchgit {
    url = "https://github.com/BigRedEye/cacos";
    rev = "cfc283b0f9a98b723a7d89ffe694732d4675fe1f";
    sha256 = "0z3g4nybv0wi9vkvq3hai3pf5war8c5dj4f25b3sn7jv8d214883";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [ cmake pkgconfig ];
  buildInputs = [ boostpkg curl gcc8 git ];

  cmakeFlags = [ "-DCMAKE_USE_CONAN=OFF -DCMAKE_EXE_LINKER_FLAGS=-ldl" ];

  enableParallelBuilding = true;

  meta = {
    homepage = "https://github.com/BigRedEye/cacos";
    description = "Ejudge client and local testing system";
    license = stdenv.lib.licenses.mit;
  };
}
