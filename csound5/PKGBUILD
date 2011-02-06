pkgname=csound5
pkgver=5.12.1
pkgrel=1
pkgdesc="A programming language designed and optimized for sound rendering and signal processing"
url="http://sourceforge.net/project/showfiles.php?group_id=81968"
arch=('i686' 'x86_64')
license=('LGPL' 'GPL')
depends=('python' 'fltk' 'portaudio' 'java-environment')
makedepends=('scons' 'swig')
provides=('csound5')
conflicts=('csound')
source=("http://downloads.sourceforge.net/csound/Csound$pkgver.tar.gz")
md5sums=('70b0c4a159c4960a09719674657949c9')
_gccOptions="-O3 -march=pentium4"
# useDouble is a requirement for using with blue via csound api
_csOptions="usePortAudio=1 usePortMIDI=0 buildCsound5GUI=1 useOSC=1 buildPythonOpcodes=1 buildInterfaces=1 buildVirtual=1 dynamicCsoundLibrary=1 buildJavaWrapper=1 useDouble=0"

build() {
  cd $srcdir/Csound$pkgver
  #patch -p1 SConstruct < ../../SConstruct.diff  
  scons customCFLAGS="$_gccOptions" $_csOptions || return 1
  #patch -p1 install.py < ../../install.py.diff  
  ./install.py --prefix=$pkgdir/usr 
  #--instdir=$pkgdir 
  #cd $startdir
  # if useDouble=0 install csound.sh instead of csound64.sh
  #install -Dm 755 csound64.sh pkg/etc/profile.d/csound.sh
}
