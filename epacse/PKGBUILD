# Maintainer: Hubert Maraszek <marach5 at gmail dot com>
pkgname=epacse
pkgver=1.0
pkgrel=1
pkgdesc="An alternative physics platformer. A short game made for Ludum Dare 21, which placed 3rd."
arch=('i686' 'x86_64')
url="http://marach.tk/epacse"
license=('CCPL:by-nd')
depends=('libgl' 'sdl' 'fmodex')
makedepends=('soil')
source=(epacse
        epacse.desktop
        epacse.png
        http://marach.tk/epacse/epacse-src.tar.gz)
md5sums=('0807c8720ad7748ddf8b5f8af24f2230'
         '863468179efd94da7b2413f91eee4209'
         '11c3fc8150231b4cd90c2e3e9bdf4af8'
         '1ad75306e7396cb6ad240230491e3c9a')

build() {
  cd "$srcdir/epacse-src"
  make
}

package() {
  install -d -m755 "$pkgdir/usr/share/epacse"
  cd "$srcdir/epacse-src"
  cp -r data "$pkgdir/usr/share/epacse"
  install -D -m755 epacse "$pkgdir/usr/share/epacse/epacse"
  install -D -m644 settings.conf "$pkgdir/usr/share/epacse/settings.conf"
  cd ..
  install -D -m755 epacse "$pkgdir/usr/bin/epacse"
  install -D -m644 epacse.png "$pkgdir/usr/share/pixmaps/epacse.png"
  install -D -m644 epacse.desktop "$pkgdir/usr/share/applications/epacse.desktop"
}

# vim:set ts=2 sw=2 et:

