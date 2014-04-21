# Maintainer: Gordon JC Pearce <gordon@gjcp.net>
pkgname=python2-osmgpsmap
pkgver=0.7.3
pkgrel=5
pkgdesc="Python bindings for osm-gps-map"
arch=('i686' 'x86_64')
url="http://nzjrs.github.com/osm-gps-map/"
license=('GPL')
depends=('python2' 'pygobject' 'pygtk' 'osm-gps-map')
source=("http://www.johnstowers.co.nz/files/osm-gps-map/python-osmgpsmap-$pkgver.tar.gz")
md5sums=('a146583c13b9d77d8d003ee87916454d')

package() {
  cd "$srcdir/python-osmgpsmap-$pkgver"
  python2 setup.py install --root=$pkgdir/ --optimize=1
}

# vim:set ts=2 sw=2 et:

