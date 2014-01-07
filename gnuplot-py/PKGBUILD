# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Michael Krauss <hippodriver@gmx.net>
# Contributor : Baptiste Jonglez <zerstorer at free dot fr>

pkgname=gnuplot-py
pkgver=1.8
pkgrel=4
pkgdesc='Plot graphs with Gnuplot'
arch=('any')
url="http://$pkgname.sourceforge.net/"
license=('LGPL')
depends=('python2-numpy' 'gnuplot')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('ab339be7847d30a8acfd616f27b5021bfde0999b7bf2d68400fbe62c53106e21')

package() {
  cd "$pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
