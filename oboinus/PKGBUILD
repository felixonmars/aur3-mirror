# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=oboinus
pkgver=2.4
pkgrel=1
pkgdesc="An X11 background previewer and setter"
arch=('any')
url="https://github.com/suniobo/oboinus/"
license=('GPL')
depends=('feh' 'pygtk>=2.6.0' 'python2-imaging')
source=($pkgname-$pkgver.tgz::https://github.com/suniobo/$pkgname/archive/release/$pkgver.tar.gz)
sha256sums=('bcadba2e7c0d2bbd6c46c0e525e7ede2c40c505b9c7b77ca9a74e5b0fc1e211a')

package() {
  cd $pkgname-release-$pkgver
  python2 setup.py install --prefix=/usr --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
