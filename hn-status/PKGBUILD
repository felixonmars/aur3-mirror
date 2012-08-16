# Maintainer: Dustin Widmann <infinity@xnowherex.com>

pkgname=hn-status
pkgver=1.1
pkgrel=1
pkgdesc="Hughesnet status monitor"
arch=('i686' 'x86_64')
url="http://qt-apps.org/content/show.php/hn-status?content=152301"
license=('GPL3')
depends=('python2-pyqt' 'python2-pytz' 'python-pycurl')
source=(http://qt-apps.org/CONTENT/content-files/152301-${pkgname}-${pkgver}.tar.gz)
md5sums=('67004263bf72bc61a9ba6f2e4f889b8e')

package() {
  mkdir -p ${pkgdir}/usr/lib/${pkgname}
  mkdir -p ${pkgdir}/usr/bin/
  cp ${srcdir}/${pkgname}/*.py ${pkgdir}/usr/lib/${pkgname}/
  chmod 755 ${pkgdir}/usr/lib/${pkgname}/hn-status.py
  ln -s /usr/lib/hn-status/hn-status.py $pkgdir/usr/bin/hn-status
}


