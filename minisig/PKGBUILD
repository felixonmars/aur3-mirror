# Contributor: Piotr Beling <qwak@stud.ics.p.lodz.pl>

pkgname=minisig
pkgver=0.4
pkgrel=1
pkgdesc="minimal signals and slots library for C++"
arch=('any')
url="http://qwak.w8.pl/index.php?topic=minisig"
license=('LGPL')
depends=()
source=(http://qwak.w8.pl/download/minisig.h)

build() {
  install -D -m u=rw,go=r ${startdir}/src/minisig.h ${startdir}/pkg/usr/include/minisig.h
}

md5sums=('b86faa2e50a14a23b67bf77a3a2f3dbd')
