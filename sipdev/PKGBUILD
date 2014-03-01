# $Id: PKGBUILD 203383 2014-01-09 08:19:52Z andrea $
# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: riai <riai@bigfoot.com>, Ben <ben@benmazer.net>

_snapshot=22c03a345d4e
pkgname=sipdev
true && pkgname=('sip' 'python-sip' 'python2-sip')
pkgver=4.15.5dev
pkgrel=3
arch=('i686' 'x86_64')
url='http://www.riverbankcomputing.com/software/sip/intro'
license=('custom:"sip"')
makedepends=('python' 'python2')
source=("http://www.riverbankcomputing.com/static/Downloads/sip4/sip-4.15.5-snapshot-$_snapshot.tar.gz")
md5sums=('ef5e55fa54e0c57d70dd8a8930a60923')

provides=('sip')
conflicts=('sip')

build() {
  cp -r sip-4.15.5-snapshot-$_snapshot python2-sip-4.15.5-snapshot-$_snapshot

  cd sip-4.15.5-snapshot-$_snapshot
  python configure.py CFLAGS="${CFLAGS}" LFLAGS="${LDFLAGS}"
  make

  ### Python2 version ###
  cd ../python2-sip-4.15.5-snapshot-$_snapshot
  python2 configure.py CFLAGS="${CFLAGS}" LFLAGS="${LDFLAGS}"
  make
}

package_sip() {
  pkgdesc="A tool that makes it easy to create Python bindings for C and C++ libraries"
  depends=('glibc')
  replaces=('sip')
  conflicts=('sip')
  provides=("sip=${pkgver}")

  cd sip-4.15.5-snapshot-$_snapshot
  make DESTDIR="${pkgdir}" install -C sipgen

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python-sip() {
  pkgdesc="Python 3.x SIP bindings for C and C++ libraries"
  depends=('sip' 'python')
  replaces=('python-sip')
  conflicts=('python-sip')
  provides=("python-sip=${pkgver}")


  cd sip-4.15.5-snapshot-$_snapshot
  make DESTDIR="${pkgdir}" install -C siplib

  install -Dm644 sipconfig.py "${pkgdir}"/usr/lib/python3.3/site-packages/sipconfig.py
  install -Dm644 sipdistutils.py "${pkgdir}"/usr/lib/python3.3/site-packages/sipdistutils.py

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-sip() {
  pkgdesc="Python 2.x SIP bindings for C and C++ libraries"
  depends=('sip' 'python2')
  replaces=('python2-sip')
  conflicts=('python2-sip')
  provides=("python2-sip=${pkgver}")

  cd python2-sip-4.15.5-snapshot-$_snapshot
  make DESTDIR="${pkgdir}" install -C siplib

  install -Dm644 sipconfig.py "${pkgdir}"/usr/lib/python2.7/site-packages/sipconfig.py
  install -Dm644 sipdistutils.py "${pkgdir}"/usr/lib/python2.7/site-packages/sipdistutils.py

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
