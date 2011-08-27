# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=penguintv
pkgver=4.1.0
pkgrel=1
pkgdesc="A podcast and video blog aggregator"
arch=('i686' 'x86_64')
url="http://penguintv.sourceforge.net/"
license=('GPL')
depends=('python-pysqlite' 'gnome-python-extras' 'pil' 'python-pycurl' 'pyxml' 'xulrunner')
optdepends=('gstreamer0.10-python: enable built-in player' 'xapian-python-bindings: enable internal rss and podcast search')
source=(http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/4.1/${pkgname}_${pkgver}-0.tar.gz)
md5sums=('98bdd2ed232d3ffe4394d1cc531a95c9')
sha256sums=('5a8911ec0f6775f3fa30d381c8958a522664eddcce2a68c2bc6925020e74d070')

build() {
  cd ${srcdir}/PenguinTV-$pkgver
  export MOZILLA_FIVE_HOME="/usr/lib/xulrunner-1.9.1"
  python setup.py install --prefix ${pkgdir}/usr 
}
