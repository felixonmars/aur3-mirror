# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Michael Krauss <hippodriver@gmx.net>
# Contributor : Baptiste Jonglez <zerstorer at free dot fr>

pkgname=python2-gnuplot
pkgver=1.8
pkgrel=1
pkgdesc='Plot graphs with Gnuplot'
arch=('any')
url='http://gnuplot-py.sourceforge.net/'
replaces=('gnuplot-py')
provides=('gnuplot-py')
license=('LGPL')
depends=('python2-numpy' 'gnuplot')
source=("http://downloads.sourceforge.net/gnuplot-py/gnuplot-py-$pkgver.tar.gz")
sha256sums=('ab339be7847d30a8acfd616f27b5021bfde0999b7bf2d68400fbe62c53106e21')

package() {
  cd "gnuplot-py-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
