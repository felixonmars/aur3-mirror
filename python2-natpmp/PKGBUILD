## "$Id$"
## Maintainer: shyokou <shyokou at gmail dot com>
##

pkgname=python2-natpmp
pkgver=20140401
pkgrel=1
pkgdesc='A python2 binding of the NAT-PMP protocol'
arch=('i686' 'x86_64')
url="http://miniupnp.free.fr/libnatpmp.html"
license=('BSD')
depends=('libnatpmp' 'python2')
makedepends=()
source=('http://miniupnp.free.fr/files/'${pkgname/#*-/lib}-${pkgver}.tar.gz
	'fix_header_issue.diff')
sha256sums=('b2ce5e626a21c795cba2d118f26e54aaa89de29d4611c440fafc49a2a5bedabb'
	'563b3722ced89f4c986c7e136f2d9bd6272750f861afdd3c7deb378e9197a2ab')

prepare() {
  cd "${srcdir}/${pkgname/#*-/lib}-${pkgver}"
  for p in ${srcdir}/*.diff ; do
    msg2 "Applying patch ${p##*/}"
    patch -sp1 < ${p} || return $?
  done
  msg2 "Applying patch by in place sed"
  sed -i.orig -e 's:\(\s\+\)python\(\s\+\)setup.py\(\s\+\):\1python2\2setup.py\3:' Makefile
  sed -i.orig -e 's:(name="libnatpmp",:(name="natpmp",:' -e 's:version="1.0",:version="20140401",:' -e 's:\(\s\+\)extra_objects=\["libnatpmp.a"\],:\1extra_link_args=["-lnatpmp"],:' setup.py
}

build() {
  cd "${srcdir}/${pkgname/#*-/lib}-${pkgver}"
#  make pythonmodule
  python2 setup.py build
}

package() {
  cd "${srcdir}/${pkgname/#*-/lib}-${pkgver}"
#  make INSTALLPREFIX="${pkgdir}/usr" \
#       INSTALLDIRINC="${pkgdir}/usr/include/${pkgname/#*-/lib}" installpythonmodule
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
