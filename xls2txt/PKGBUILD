# Author: stroncium <yanis.benson@gmail.com>
pkgname=xls2txt
pkgver=0.14
pkgrel=1
pkgdesc="This utility prints Excel spreadsheet (XLS, XLW) as a plain text in tab separated form."
arch=('x86_64' 'i686')
url="http://wizard.ae.krakow.pl/~jb/xls2txt/"
license=('GPL')
depends=(
  )
source=(
  "http://wizard.ae.krakow.pl/~jb/xls2txt/${pkgname}-${pkgver}.tar.gz"
  )

md5sums=(
  '166f73faac17248c5187b4c6029550bf'
  )

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make || return 1
  mkdir -p ${pkgdir}/usr/bin || return 1
  make BINDEST="${pkgdir}/usr/bin" install || return 1
}

