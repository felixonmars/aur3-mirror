# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=pbrt
pkgver=2
pkgrel=1
pkgdesc="Physically Based Renderer"
arch=('i686' 'x86_64')
url="http://www.pbrt.org/"
license=('GPL')
depends=('openexr')
source=(http://www.pbrt.org/src/$pkgname-v$pkgver-src.tar.bz2)
md5sums=('166930509608a52f233d639ae26bb8fb')

build() {
  cd "$srcdir"/$pkgname-v$pkgver/src
  make
  install -d -m755 "$pkgdir"/usr/bin
  install -m755 bin/* "$pkgdir"/usr/bin/

  cd "$srcdir"/$pkgname-v$pkgver/exporters
  install -d -m755 "$pkgdir"/usr/share/blender/scripts/
  install -D -m644 blender/*.py "$pkgdir"/usr/share/blender/scripts/pbrtexport.py
}

# vim:set ts=2 sw=2 et:
