# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=penguintv
pkgver=4.2.0
pkgrel=1
pkgdesc="A podcast and video blog aggregator"
arch=('any')
url="http://penguintv.sourceforge.net/"
license=('GPL')
depends=('python-pysqlite' 'gnome-python-extras' 'pil' 'python-pycurl' 'pyxml' 'xulrunner')
depends+=('python2')
depends+=('sh')
optdepends=('gstreamer0.10-python: enable built-in player' 'xapian-python-bindings: enable internal rss and podcast search')
makedepends=('python2' 'patch')
source=(http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver%.*}/${pkgname}_${pkgver}.tar.gz)
md5sums=('9458c7ce15cca0469a131de5a01bbd8d')
sha256sums=('cfcd52fdb37d93eb31148a3c8097e54dc8ca0181c5a8e38483c372ae98e4e4b2')

source+=(python2.patch)
md5sums+=('c396da58f51fdcf0e9c211829ec374b3')
sha256sums+=('f7021c2f2a7475e60515c2555d87d4416b67d0d28f14f57d2dc6f911f4c0ac07')

build() {
  patch -d "${srcdir}/PenguinTV-${pkgver}" -p 0 < python2.patch
}

package() {
  cd ${srcdir}/PenguinTV-$pkgver
  export MOZILLA_FIVE_HOME="/usr/lib/xulrunner-1.9.1"
  python2 setup.py install --prefix ${pkgdir}/usr 
}
