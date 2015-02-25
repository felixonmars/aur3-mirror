# Maintainer: Somebody <somebody[at]foo[dot]tld>
pkgname=pideo
pkgver=0.2.0
pkgrel=1
pkgdesc="A simple script to play videos from storage devices in your RPi."
url="http://github.com/darkhogg/piplay"
arch=('any')
license=('GPL3')
depends=('udevil' 'udisks2' 'dialog')
source=('pideo')
md5sums=('caf7c73a074e8133cc8b1b7b27c04da4')

package() {
  install -Dm755 pideo "$pkgdir/usr/bin/pideo"
}
