# Maintainer: Max Meyer <dev|fedux.org>
pkgname=netcfg-dmenu
pkgver=0.0.21
pkgrel=1
epoch=
pkgdesc="easier access to netcfg's network profiles"
arch=(any)
url="https://github.com/maxmeyer/netcfg-dmenu"
license=('MIT')
depends=('netcfg' 'dmenu' 'ttf-dejavu')
install=$pkgname.install
source=(https://github.com/maxmeyer/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('d859772eb274da372ed42be787ecbb5da5ba5c04c56fa2fc01266f36d1681323')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX="/usr" install

  #create directory
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  #link license
  ln -s /usr/share/doc/${pkgname}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}

# vim:set ts=2 sw=2 et:
