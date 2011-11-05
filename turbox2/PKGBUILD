# Contributor: Andreas B. Wagner <AndreasBWagner@gmail.com>
pkgname=turbox2
pkgver=0.5
pkgrel=1
pkgdesc="turbox2 is an XMMS2 client using TurboGears."
arch=('i686' 'x86_64')
url="http://people.xmms2.org/~alex/turbox2/index.html"
license=('GPLv3')
depends=('xmms2' 'turbogears')

source=("http://people.xmms2.org/~alex/turbox2/${pkgname}-${pkgver}.tar.gz")
md5sums=('60575335a0bd0123fe3a07d1b2903b57')

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python2_sitelib=$(python2 -c "from distutils.sysconfig import get_python_lib; print get_python_lib()")
  mkdir -p ${pkgdir}${python2_sitelib}
  PYTHONPATH="${pkgdir}${python2_sitelib}" python2 ./setup.py install --root "$pkgdir"
}
