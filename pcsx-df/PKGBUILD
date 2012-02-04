# Contributor: Jose Valecillos <valecillosjg (at) gmail (dot) com>
pkgname=pcsx-df
pkgver=1.10
pkgrel=2
pkgdesc="Debian fork of the abandoned original PCSX"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/pcsx-df"
license=('GPL')
groups=()
depends=('libglade' 'libgl' 'libxv' 'alsa-lib' 'bzip2')
makedepends=('pkgconfig' 'intltool' 'mesa' 'diffutils' 'portaudio' 'nasm' 'fltk' 'nautilus-cd-burner')
optdepends=()
provides=(pcsx)
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz patch01.patch)
noextract=()
md5sums=('eba0decf8bc9938e47984328400d74d9'
         '6bad561187aae57bef738ee505c85bdf')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  
  patch -p1 < "$srcdir/patch01.patch"
  
  sh autogen.sh
  ./configure --prefix=/usr --enable-alsa
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

