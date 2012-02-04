# Contributor: Corrado 'bardo' Primier <corrado.primier@mail.polimi.it>

pkgname=dupseek
pkgver=1.3
pkgrel=2
pkgdesc="A utility to find file duplicates"
url="http://www.beautylabs.net/software/dupseek.html"
depends=('perl')
license="GPL"
arch=('i686')
source=(http://www.beautylabs.net/software/${pkgname}-${pkgver}.tgz)
md5sums=('14aedcd2fea54fb11704f8450c04f228')

build() {
  install -d ${startdir}/pkg/usr/bin
  install -m 755 ${startdir}/src/${pkgname}-${pkgver}/dupseek ${startdir}/pkg/usr/bin
}
