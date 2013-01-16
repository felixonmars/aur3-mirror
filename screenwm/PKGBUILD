# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: Xilon <Xilon@gmail.com>

pkgname=screenwm
pkgver=1.0
pkgrel=2
pkgdesc="An extension to GNU Screen"
arch=('i686' 'x86_64')
url="http://www.nas.nasa.gov/~kolano/projects/screenwm.html"
license=('custom')
depends=('screen')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('001bc75daa6f3183bc32b56a155cf545')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 screenwmrc "$pkgdir/usr/share/$pkgname/screenwmrc"
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
  install -Dm644 CHANGES "$pkgdir/usr/share/doc/$pkgname/CHANGES"
  install -Dm644 INSTALL "$pkgdir/usr/share/doc/$pkgname/INSTALL"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
