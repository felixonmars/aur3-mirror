# Contributor: Ali Gündüz <gndz.ali@gmail.com>
pkgname=pyblosxom-new
pkgver=1.5rc2
pkgrel=3
pkgdesc="Lightweight file-based weblog system"
arch=('i686' 'x86_64')
url="http://pyblosxom.sourceforge.net/" 
license=('MIT')
depends=('python')
source=(http://pyblosxom.bluesock.org/download/pyblosxom-1.5rc2.tar.gz)
md5sums=(0a16c94badaa4876fdd579fe69328957)

build() {
  cd ${srcdir}/pybloxsom-1.5rc2
  python2 setup.py install --root=$pkgdir || return 1
  install -D -m0644 LICENSE $pkgdir/usr/share/licenses/pyblosxom/LICENSE.txt
}

