# Contributer: fnord0 <fnord0 AT riseup DOT net>
pkgname=pymills
pkgver=3.4
pkgrel=2
pkgdesc="Pymills provides a very easy to use and powerful event library enabling asyncronous and event-driven applications and system to be developed."
arch=('any')
url="http://trac.shortcircuit.net.au/pymills"
license=('GPL')
depends=('python')
source="http://pypi.inqbus.de/${pkgname}/${pkgname}-${pkgver}.tar.gz"
md5sums=('5741d4a5c30aaed5def2f4b4f86e92a9')
sha1sums=('63bce91f3223ae10e8a074aec6b2f06725e1a354')

build() {
	  cd ${srcdir}
	  mv ${pkgname}-${pkgver} ${pkgname} || return 1
	  cd ${srcdir}/${pkgname}
	  python2 setup.py install --root=${pkgdir}/ --optimize=1 || return 1
}
