# Maintainer: Swen Simon <swsimon at gmail dot com>

pkgname=holyoracle
pkgver=0.1
pkgrel=2
pkgdesc="The helpful holy all knowing oracle to help with decisions"
url="http://no.url"
arch=('i686' 'x86_64')
license=('GPL')
source=(holyoracle)
md5sums=('c8b169b8ad159320a89af44694273dd4')

build() {
  cd $startdir/src
  
  mkdir -p $startdir/pkg/usr/bin
  cp $startdir/src/holyoracle $startdir/pkg/usr/bin

  install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
