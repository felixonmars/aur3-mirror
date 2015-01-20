# Maintainer: kfgz <kfgz at interia dot pl>
# Contributor: Hubert Czobodziński <hcz at onet dot eu>

pkgname=ddccontrol-db
pkgver=20061014
pkgrel=3
pkgdesc="Monitor database for DDCControl"
arch=('i686' 'x86_64')
url="http://ddccontrol.sourceforge.net/"
license=('GNU')
source=(${pkgname}-${pkgver}.tar.bz2::http://sourceforge.net/projects/ddccontrol/files/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.bz2/download)
md5sums=('91951918e5bc553c251776cdff8cea9c')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
