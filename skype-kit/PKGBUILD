# Maintainer: Jakub Kozisek <nodevel at gmail dot com>

pkgname=skype-kit
pkgver=0.1
pkgrel=3
pkgdesc="A set of scripts that helps making Skype reliable."
arch=('any')
url="http://www.thelins.se/johan/blog/resources/skype-reliabilitator/"
license=('BSD')
optdepends=('skype: quite obious' 'kdebase-kdialog: needed if using the check-skype-status script')
provides=('skype-kit')
source=(http://www.thelins.se/johan/blog/wp-content/uploads/2011/01/skype-kit.tar.gz)

build() {
  cd $srcdir
  mkdir usr
  mv bin ./usr/bin
  cp -rf usr $pkgdir

}
md5sums=('fbec18e7a972cd6333edd8416191a1dd')
