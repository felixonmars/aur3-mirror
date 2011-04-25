pkgname=mencal2
pkgver=1.1
pkgrel=1
pkgdesc="a menstruation calendar"
arch=('any')
url="http://tim.thechases.com/bvi/mencal2.html"
license=('GPLv2')
depends=('python')
source=('http://tim.thechases.com/bvi/mencal2.py' 'http://sainthuck.de/dynamic/mencal2.patch')
md5sums=('da4f2381029e5cf4cce151430c1e1d86' '4a98144b48877b120319abc2e57c6873')

build() {
  cd "${srcdir}/"
  patch mencal2.py < mencal2.patch
  mkdir -p  ${startdir}/pkg/usr/bin/
  install -m 755 ${srcdir}/mencal2.py ${startdir}/pkg/usr/bin/mencal2
}
