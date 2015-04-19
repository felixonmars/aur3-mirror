# Maintainer: Joe Searle <joe@joe-searle.com>
pkgname=python2-pyst
pkgver=0.6.50
pkgrel=3
pkgdesc="Python Asterisk Gateway Interface (AGI) bindings"
arch=(any)
url="http://sourceforge.net/projects/pyst"
license=('LGPL')
depends=('python2')
makedepends=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://downloads.sourceforge.net/pyst/pyst-$pkgver.tar.gz)
md5sums=('89393dfc65fa9bca1b213e823488db40')

package(){
  cd ${srcdir}/pyst-${pkgver}
  
  python2 setup.py install --root=${pkgdir}/ --optimize=1
}
