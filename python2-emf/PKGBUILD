#Maintainer: Gergely Imreh <imrehg(at)gmail(dot)com>
pkgname=python2-emf
_orig_name=pyemf
pkgver=2.0.0
pkgrel=1
pkgdesc="Pure Python2 module that provides bindings for an ECMA-234 compliant vector graphics library (ie. Enhanced Metafile)"
depends=('python2')
arch=('any')
url="http://pyemf.sourceforge.net/"
license=('GPL')
provides=('pyemf' 'python-emf')
source=("http://sourceforge.net/projects/pyemf/files/pyemf/2.0.0/pyemf-2.0.0.tar.gz")
build() {
  cd "${srcdir}/${_orig_name}-${pkgver}"
  python2 setup.py install --root "${pkgdir}" || return 1
}
md5sums=('9bc0ad58e0153eeb32604ddab216191a')
