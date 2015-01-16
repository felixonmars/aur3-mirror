# Contributor: Tianjiao Yin <ytj000+aur@gmail.com>

pkgname=firefox-extension-downthemall-beta
pkgver=3.0b5
pkgrel=1
pkgdesc="A Download Manager extension for Firefox with advanced capabilities - Bleeding edge version"
arch=('any')
url="http://www.downthemall.net/"
license=('GPL2')
depends=('firefox')
source=('https://code.downthemall.net/releases/downthemall-3.0b5.xpi')
md5sums=('f3dc74911b6722b11abe85d983eef3b7')

package() {
  dstdir="$pkgdir/usr/lib/firefox/browser/extensions/{DDC359D1-844A-42a7-9AA1-88A850A938A8}"
  install -d "$dstdir"
  rm *.xpi
  mv * "$dstdir"
}
