pkgname=dawawin-stable
pkgver=0.2.1
pkgrel=1
pkgdesc="Display and store Arabic poems."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/dawawin"
license=('Waqf')
depends=('python2' 'python2-gobject' 'gtk3' 'gstreamer')
makedepends=('python2')
source=("http://sourceforge.net/projects/dawawin/files/dawawin-${pkgver}.tar.gz")
md5sums=('ad72712a0ac780696060b70d9d8843ff')

build() {
  cd ${srcdir}/dawawin-${pkgver}
  python2 setup.py build
}

package() {
  cd ${srcdir}/dawawin-${pkgver}
  python2 setup.py install --root=${pkgdir} --optimize=2 --record=INSTALLED_FILES
}
