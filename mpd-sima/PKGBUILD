# Maintainer: Vincent Berset <msieurhappy@gmail.com>
pkgname=mpd-sima
pkgver=0.10.0
pkgrel=1
pkgdesc="Automagically add title to mpd playlist based on last.fm recomendations"
arch=('any')
url="http://codingteam.net/project/sima"
license=('GPL')
depends=('python2' 'python2-mpd')
makedepends=('make')
source=("http://codingteam.net/project/sima/download/file/mpd_sima_$pkgver.tar.xz")
md5sums=('606a7202bea64830237e79f7cb20dc92')

build() {
  cd "$srcdir/mpd_sima_$pkgver"

  sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' \
      src/mpd_sima src/simadb_cli
  make PREFIX="/usr"
}

package() {
  cd "$srcdir/mpd_sima_$pkgver"
  make DESTDIR="$pkgdir" PREFIX="/usr" ETC="$pkgdir/etc" install
  make ETC="$pkgdir/etc" bash_completion
}
