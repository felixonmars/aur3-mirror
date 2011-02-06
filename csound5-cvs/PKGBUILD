# Contributor: Jon Austin (IRC: slypheed) <jon.i.austin (gmail)>
pkgname=csound5-cvs
pkgver=20100130
pkgrel=1
pkgdesc="A programming language designed and optimized for sound rendering and signal processing"
url="http://sourceforge.net/project/showfiles.php?group_id=81968"
arch=('i686' 'x86_64')
license=('LGPL' 'GPL')
depends=('python' 'fltk' 'portaudio' 'jdk')
makedepends=('scons' 'swig' 'cvs')
provides=('csound5')
conflicts=('csound')
install=${pkgname}.install
md5sums=("518f1d6b24f96c05ff619970418bbe22")
_gccOptions="-O3 -march=pentium4"
# useDouble is a requirement for using with blue via csound api
_csOptions="usePortAudio=1 usePortMIDI=0 buildCsound5GUI=1 useOSC=1 buildPythonOpcodes=1 buildInterfaces=1 buildVirtual=1 dynamicCsoundLibrary=1 buildJavaWrapper=1 useDouble=1"
_cvsroot=":pserver:anonymous:@csound.cvs.sourceforge.net:/cvsroot/csound"
_cvsmod="csound5"

build() {
  cd "$srcdir"
  msg "Connecting to csound.sourceforge.net CVS server...."
  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs -z3 update -d
  else
    cvs -z3 -d $_cvsroot co -D $pkgver -P $_cvsmod
    cd $_cvsmod
  fi

  if [ -e "$srcdir"/$_cvsmod-build ]; then
    rm -rf "$srcdir"/$_cvsmod-build
  fi

  cp -r "$srcdir"/$_cvsmod "$srcdir"/$_cvsmod-build
  cd "$srcdir"/$_cvsmod-build

  scons customCFLAGS="$_gccOptions" $_csOptions || return 1
  python install.py --prefix=$pkgdir || return 1
}
