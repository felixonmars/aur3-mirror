# Contributor: Ubermensch <gpp13@libero.it>

pkgname=pygraph
pkgver=2.3.2
_pkgver=02_03_02
pkgrel=1
pkgdesc="Graphics library for python."
arch=('i686' 'x86_64')
url="http://pythongraph.googlecode.com/"
license=('GPL')
depends=('python>=2.6' 'python<2.7')
source=("http://pythongraph.googlecode.com/files/${pkgname}${_pkgver}.zip")
md5sums=('7482c1d26547296666e078de1aeac4da') 

build() {
  cd ${srcdir}/$pkgname
  install -d ${pkgdir}/usr/lib/python2.6/site-packages/pygraph
  
  for file in ${srcdir}/$pkgname/pygraph/*.py; do
    install -Dm644 $file \
      ${pkgdir}/usr/lib/python2.6/site-packages/pygraph/$(basename $file) || return 1
  done

  install -m644 pygraph.pth \
    ${pkgdir}/usr/lib/python2.6/site-packages || return 1
}
