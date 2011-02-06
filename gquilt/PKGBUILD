# Contributor: dibblethewrecker <dibblethewrecker.at.jiwe.org>

pkgname=gquilt
pkgver=0.25
pkgrel=1
pkgdesc='A PyGTK GUI wrapper for quilt'
arch=('any')
url='http://gquilt.sourceforge.net/'
license=('GPL2')
depends=('quilt' 'pygtk')
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('090083f0dd137af19f22acaa13a312ef')

package() {
  cd ${pkgname}-${pkgver}

  python2 setup.py install --root="${pkgdir}"
  desktop-file-install gquilt.desktop --dir "${pkgdir}/usr/share/applications"
}
