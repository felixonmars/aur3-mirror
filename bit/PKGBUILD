# Maintainer: Linus Sjögren <thelinx@unreliablepollution.net>
pkgname=bit
pkgver=0.3
pkgrel=2
pkgdesc="minimal build system written in python"
license=('BSD')
arch="any"
url="https://github.com/sahchandler/bit"
depends=('python2')
conflicts=('bit-git')
source=("https://github.com/sahchandler/bit/tarball/CaressOfSteel-0.3")
md5sums=('9e38f0c46a085d00f839dc693e237eef')

package() {
  cd "$srcdir"
  cd `find -name sahchandler*`
  python2 setup.py install --prefix=$pkgdir/usr
  install -Dm0644 License.md \
    $pkgdir/usr/share/licenses/$pkgname/License.md
}
