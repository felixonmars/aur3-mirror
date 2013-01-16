# Maintainer: TDY <tdy@archlinux.info>

pkgname=sedtris
pkgver=1
pkgrel=1
pkgdesc="Tetris written in sed"
arch=('any')
url="http://uuner.doslash.org/forfun/"
license=('custom')
depends=('bash' 'sed')
source=(http://uuner.doslash.org/forfun/$pkgname.sed
        http://uuner.doslash.org/forfun/$pkgname.sh
        LICENSE::https://raw.github.com/alexgenaud/Poetic-License/master/README)
md5sums=('4cc599bc515b4667e4885fad4fc720a7'
         'e09dfc11872a0a314e5f663c11aea242'
         'a18e9749a915edbf13d67db3cbff9d34')

package() {
  cd "$srcdir"
  install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.sed "$pkgdir/usr/share/$pkgname/$pkgname.sed"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  sed -i 's|`dirname $0`|/usr/share/sedtris|' "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
