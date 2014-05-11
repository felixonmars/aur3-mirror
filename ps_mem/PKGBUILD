# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Ali Gündüz <gndz.ali@gmail.com>
pkgname=ps_mem
pkgver=3.2
pkgrel=2
pkgdesc="List processes by memory usage"
arch=('any')
url="http://www.pixelbeat.org/scripts/"
license=('GPL')
# compatible with both py2 and py3
depends=('python')
#source=("https://raw.github.com/pixelb/scripts/master/scripts/$pkgname.py")
source=("http://www.pixelbeat.org/scripts/$pkgname.py")
md5sums=('09dbc42082ffa7645fa16e8710eec79b')

package() {
  cd "$srcdir"
  install -Dm755 ps_mem.py "$pkgdir/usr/bin/$pkgname"
}

