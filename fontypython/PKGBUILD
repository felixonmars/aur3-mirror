# Maintainer: TDY <tdy@archlinux.info>

pkgname=fontypython
pkgver=0.4.4
pkgrel=1
pkgdesc="A font viewer and manager"
arch=('i686' 'x86_64')
url="http://savannah.nongnu.org/projects/fontypython/"
license=('GPL3')
depends=('python2-pillow' 'wxpython')
install=fp.install
source=(http://download.savannah.gnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('cb7ecba75f35b1db2ae0b171c06433cd119be98b589a5af2f7642a343ff97a4b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
