# $Id$
# Maintainer: Samuel Mesa <samuelmesa@linuxmail.org>
# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: riai <riai@bigfoot.com>, Ben <ben@benmazer.net>

pkgbase=sip4
pkgname=sip4
true &&  pkgname=('sip4' 'python-sip4' 'python2-sip4')
pkgver=4.14.6
pkgrel=1
arch=('i686' 'x86_64')
url='http://www.riverbankcomputing.com/software/sip/intro'
license=('custom:"sip"')
makedepends=('python' 'python2')
source=("http://downloads.sourceforge.net/pyqt/sip-${pkgver}.tar.gz")
md5sums=('d6493b9f0a7911566545f694327314c4')

build() {
  cp -r sip-${pkgver} python2-sip-${pkgver}

  cd sip-${pkgver}
  python configure.py CFLAGS="${CFLAGS}" LFLAGS="${LDFLAGS}"
  make
  
  ### Python2 version ###
  cd ../python2-sip-${pkgver}
  python2 configure.py CFLAGS="${CFLAGS}" LFLAGS="${LDFLAGS}"
  make
}

package_sip4() {
  pkgdesc="A tool that makes it easy to create Python bindings for C and C++ libraries"
  depends=('glibc')

  cd sip-${pkgver}
  make DESTDIR="${pkgdir}" install -C sipgen

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python-sip4() {
  pkgdesc="Python 3.x SIP bindings for C and C++ libraries"
  depends=('sip' 'python')

  cd sip-${pkgver}
  make DESTDIR="${pkgdir}" install -C siplib
  
  install -Dm644 sipconfig.py "${pkgdir}"/usr/lib/python3.3/site-packages/sipconfig.py
  install -Dm644 sipdistutils.py "${pkgdir}"/usr/lib/python3.3/site-packages/sipdistutils.py
  
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-sip4() {
  pkgdesc="Python 2.x SIP bindings for C and C++ libraries"
  depends=('sip' 'python2')

  cd python2-sip-${pkgver}
  make DESTDIR="${pkgdir}" install -C siplib
  
  install -Dm644 sipconfig.py "${pkgdir}"/usr/lib/python2.7/site-packages/sipconfig.py
  install -Dm644 sipdistutils.py "${pkgdir}"/usr/lib/python2.7/site-packages/sipdistutils.py
  
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
