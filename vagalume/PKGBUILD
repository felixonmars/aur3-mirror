# Maintainer: corvolino <corvolino@archlinux.com.br>

pkgname=vagalume
pkgver=0.8.5
pkgrel=1
pkgdesc="is a Last.fm client for Gnome and Maemo"
arch=('i686' 'x86_64')
url="http://vagalume.igalia.com"
license=('GPL')
depends=('curl' 'gstreamer0.10-ugly-plugins' 'gstreamer0.10-base-plugins' 'gstreamer0.10-good-plugins' 'gtk2' 'libxml2' 'libnotify' 'intltool')
makedepends=('pkgconfig')
source=(http://vagalume.igalia.com/files/source/${pkgname}-${pkgver}.tar.gz)
md5sums=('fba804c44ecb441bca92f499be9377e1')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}


