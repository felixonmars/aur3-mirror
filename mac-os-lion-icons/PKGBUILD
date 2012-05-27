# Maintainer: dale mallion <dale.mallion@gmail.com>
pkgname=mac-os-lion-icons
pkgver=2
pkgrel=1
pkgdesc="MAC OS X Lion Icon Theme by MB0SS"
arch=('any')
url="http://mbossg.deviantart.com/#/d4yqyle"
license=('unknown')
source=('https://dl.dropbox.com/s/ysdappxqrvxkj9c/mac-os-lion-icons.tar.gz')
md5sums=('d45946ecbdae94e7307f4529a7a0da7c')

build() {
  cd "$srcdir"
  mkdir -p "${pkgdir}"/usr/share/icons

  cp -rf $pkgname "${pkgdir}"/usr/share/icons/

  chmod 755 -R "$pkgdir"/usr/share/icons
}
