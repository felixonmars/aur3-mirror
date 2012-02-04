# Contributor: Corali Signs Co. <coralisigns[at]gmail[dot]com>
pkgname=rezound-64
pkgver=0.12.3beta
pkgrel=4
pkgdesc="ReZound aims to be a stable, open source, and graphical audio file editor primarily for but not limited to the Linux operating system."
url="http://rezound.sourceforge.net/"
depends=('gcc-fortran' 'fftw2double' 'fox' 'libvorbis' 'audiofile' 'soundtouch')
makedepends=('flex' 'bison')
source=(http://downloads.sourceforge.net/sourceforge/rezound/rezound-$pkgver.tar.gz flacpatch gcc43.patch kyr-gcc4.patch kyr-x64.patch kyr-01.patch 
kyr-02.patch kyr-03.patch)
md5sums=('df109c9d9ad6d27214a7417df583115d' '440991794129922eb27623a616ab3df8' '65d8d469c2c164f18849ef6ca1f64cfe' 'eb97872099d3c98e0cc9d07d2b1bc92f' 
'35b81106b6b04fbf4af763e84f0f5429' '0c3f98e38378e46ec0b0f0d94d466d41' 'ea15ede8787039765c69255220c2b0ce' '415ca1ca0bb9ab1c135df9b0493fc0f3')
arch=('x86_64')
license=('GPL')
conflicts=('rezound')
provides=('rezound' 'rezound-64')

build() {
  cd $startdir/src/rezound-$pkgver
	patch -p1 <../flacpatch
	patch -p1 <../gcc43.patch
    patch -p1 <../kyr-gcc4.patch
    patch -p1 <../kyr-x64.patch
    patch -p1 <../kyr-01.patch
    patch -p1 <../kyr-02.patch
    patch -p1 <../kyr-03.patch
  ./configure --prefix=/usr --disable-portaudio
  make || return 1
  make DESTDIR=$startdir/pkg install
}
