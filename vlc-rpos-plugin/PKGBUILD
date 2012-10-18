# Contributer: giacomogiorgianni@gmail.com 


pkgname=vlc-rpos-plugin
_name=libsrpos_plugin
pkgver=0.2
pkgrel=1
pkgdesc="Plugin for VLC player (save/restore movie position)"
arch=(any)
url="http://code.google.com/p/vlc-srpos-plugin/"
license=('GPL')
depends=('vlc')
makedepends=('make')
source=("http://vlc-srpos-plugin.googlecode.com/files/$_name-$pkgver.tar.gz")
md5sums=('62013b61fa72d9813ec5010fe4e0d656')

build() {
  cd "$srcdir/$_name-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_name-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
