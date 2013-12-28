# Maintainer: Thomas Chojecki <info@rayman2200.de>
pkgname=mcmap
pkgver=2.4.2
pkgrel=2
pkgdesc="A tiny map visualizer for Minecraft. Maps are drawn from an isometric perspective. Forked and continued by WRIM."
arch=('i686' 'x86_64')
url="http://www.minecraftforum.net/viewtopic.php?f=25&t=40327"
license=('CCPL')
depends=('libpng' 'gcc-libs')
source=('https://github.com/WRIM/mcmap/archive/v2.4.2.tar.gz')
sha1sums=('20102af85f4dba4f7b008419047792953d174f10')

build() {
  cd "$srcdir/mcmap-$pkgver"
  make
}

package() {
  mkdir -p $pkgdir/usr/bin
  install -m755 $srcdir/mcmap-$pkgver/mcmap $pkgdir/usr/bin/
}

# vim:set ts=2 sw=2 et:
