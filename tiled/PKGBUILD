# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=tiled
pkgver=0.7.2
pkgrel=1
pkgdesc="A general purpose tile map editor"
arch=('i686' 'x86_64')
url="http://mapeditor.org/"
license=('GPL')
depends=('jre')
makedepends=('apache-ant' 'jdk')
source=($url/files/$pkgname-$pkgver-src.zip \
	$pkgname.sh)
md5sums=('0bcb3f81da615b8531b9d4507b07293a'
         'e8689c0747c0fbb737a89aaa98e485fb')

build() {
  cd $pkgname-$pkgver

  ant || return 1

  mkdir -p $pkgdir/usr/share
  cp -rf dist/ $pkgdir/usr/share/tiled/

  install -Dm755 ../$pkgname.sh $pkgdir/usr/bin/$pkgname
}

# vim:set ts=2 sw=2 et:
