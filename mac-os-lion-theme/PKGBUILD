# Maintainer: dale mallion <dale.mallion@gmail.com>
pkgname=mac-os-lion-theme
pkgver=2
pkgrel=2
pkgdesc="MAC OS X Lion Theme by MB0SS"
arch=('any')
url="http://mbossg.deviantart.com/#/d4yqyle"
license=('unknown')
source=('https://dl.dropbox.com/s/46tdsd71s38wggf/mac-os-lion-theme.tar.gz')
md5sums=('37472bac84a3e6f1f83d2a2a622f2c48')

build() {
  cd "$srcdir"
  mkdir -p "${pkgdir}"/usr/share/themes

  cp -rf $pkgname "${pkgdir}"/usr/share/themes/

  chmod 755 -R "$pkgdir/usr/share/themes"
}
