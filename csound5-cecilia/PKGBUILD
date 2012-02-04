pkgname=csound5-cecilia
pkgver=5.12.1
pkgrel=1
pkgdesc="A programming language designed and optimized for sound rendering and signal processing. Using Cecilia4 build configuration."
url="http://sourceforge.net/project/showfiles.php?group_id=81968"
arch=('i686' 'x86_64')
license=('LGPL' 'GPL')
depends=('python' 'fltk' 'portaudio' 'java-environment')
makedepends=('scons' 'swig')
provides=('csound5')
conflicts=('csound')
source=("http://downloads.sourceforge.net/csound/Csound$pkgver.tar.gz")
md5sums=('70b0c4a159c4960a09719674657949c9')
_csOptions="usePortAudio=1 usePortMIDI=0 buildCsound5GUI=1 useOSC=1 buildPythonOpcodes=1 buildInterfaces=1 buildVirtual=1 dynamicCsoundLibrary=1 useDouble=1 useCoreAudio=0 buildPythonWrapper=1 prefix=/usr tclversion=8.5"

build() {
  cd $srcdir/Csound$pkgver
  sed '762,764d' SConstruct
  scons $_csOptions || return 1
  python2 install.py --prefix=$pkgdir/usr
}
