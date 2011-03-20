# Contributor: Army <uli[dot]armbruster[at]gmail[dot].com>
pkgname=sego3
pkgver=0.56
pkgrel=1
pkgdesc="tool to control your id3tags"
url="http://www.archlinux.org"
depends=('python-eyed3' 'wmctrl')
optdepends=("feh: to display info about jpegs")
license=('GPL')
source=(${pkgname} readid3)
arch=(any)

build() {
  install -D -m755 ${srcdir}/sego3 ${pkgdir}/usr/bin/sego3
  install -D -m755 ${srcdir}/readid3 ${pkgdir}/usr/bin/readid3
}
md5sums=('f94597a083406eaccfe7871c2c44b057'
         '4e02445547e637955565904ccaab6c23')
