# Contributor: irgaly <irgaly@fird.net>

pkgname=adobe-air-beta
pkgver=2.0beta2
pkgrel=1
license='custom'
arch=('i686' 'x86_64')
pkgdesc="Crossplatform desktop applications build using proven web technologies"
url="http://labs.adobe.com/technologies/air/"
source=('adobe-air')
depends=('adobe-air-sdk-beta')
conflicts="adobe-air"
md5sums=('ef9d55972a163ddc8935b0554014b80d')

build() {
  install -Dm755 $srcdir/adobe-air $pkgdir/usr/bin/adobe-air
}
