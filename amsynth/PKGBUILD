# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Alessio Biancalana <dottorblaster@gmail.com>

pkgname=amsynth
pkgver=1.3.2
pkgrel=2
pkgdesc="Analogue Modeling SYNTHesizer"
arch=('i686' 'x86_64')
url="http://code.google.com/p/amsynth/"
license=('GPL')
depends=('gtkmm' 'jack' 'liblo')
makedepends=('desktop-file-utils' 'dssi' 'libtool')
install="$pkgname.install"
source=("http://amsynth.googlecode.com/files/amSynth-$pkgver.tar.gz")
md5sums=('991329e433bb8c496f9ca5158faf0bca')

build() {
  cd "$srcdir/amSynth-$pkgver"
  libtoolize
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/amSynth-$pkgver"
  make DESTDIR="$pkgdir/" install
}
