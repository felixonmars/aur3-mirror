# Maintainer: TDY <tdy@archlinux.info>

pkgname=ifreebudget
pkgver=2.0.29
pkgrel=1
pkgdesc="A personal finance and budgeting application"
arch=('any')
url="http://www.ifreebudget.com/"
license=('APACHE')
depends=('java-runtime>=6')
source=(http://downloads.sourceforge.net/$pkgname/iFreeBudget-$pkgver.zip
        fm.desktop fm.sh)
sha256sums=('315fe05c6ed7c39ddef9536d4eeb3dafaf0d16e102db1f0b2c14072167d94c97'
            '78561df2ba3cd9b7c08a93e7194d551a4b56b64ecbc04d4ff5427638381002ab'
            '94424e6a6b0d2c9bfa309a7aec9552704c132ed85c38f363be56b0b8c6aa419a')

package() {
  cd "$srcdir/fm"
  install -Dm755 ../fm.sh "$pkgdir/usr/bin/$pkgname"
  install -Dm644 ../fm.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 fmbin.jar "$pkgdir/usr/share/java/$pkgname/fmbin.jar"
  install -Dm644 splash.jpg "$pkgdir/usr/share/java/$pkgname/splash.jpg"

  cp -rf icons lib resources "$pkgdir/usr/share/java/$pkgname"
  find "$pkgdir/usr/share/java/$pkgname" -type d -exec chmod 755 -- '{}' \;
  find "$pkgdir/usr/share/java/$pkgname" -type f -exec chmod 644 -- '{}' \;
}

# vim:set ts=2 sw=2 et:
