# Maintainer: Bernardo Barros <bernardobarros at gmail dot com>
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname=faust-with-extras
_realname=faust
pkgver=0.9.30
pkgrel=1
pkgdesc="A compiled language for real-time audio signal processing (with tools installed)."
arch=('i686' 'x86_64')
url="http://faust.grame.fr/"
license=('GPL')
conflicts=('faust-git' 'faust-cvs' 'faust')
source=("http://downloads.sourceforge.net/project/faudiostream/$_realname-$pkgver.tar.gz")
md5sums=('aee067c8f2183949a6f5ea2556f1934a')

build() {
  cd "$srcdir/$_realname-$pkgver"
  make prefix=/usr
}

package() {
  cd "$srcdir/$_realname-$pkgver"
  make prefix=/usr DESTDIR="$pkgdir/" install

  cd "$srcdir/$_realname-$pkgver/tools/faust2appls/"
  make prefix=/usr DESTDIR="$pkgdir/" install

  cd "$srcdir/$_realname-$pkgver/tools/faust2pd-1.0.2/"
  make prefix=/usr DESTDIR="$pkgdir/" instal

  cd "$srcdir/$_realname-$pkgver/tools/faust2sc-1.0.0/"
  make prefix=/usr DESTDIR="$pkgdir/" install

}
