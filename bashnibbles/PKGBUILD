# Maintainer: TDY <tdy@gmx.com>

pkgname=bashnibbles
pkgver=0.1
pkgrel=1
pkgdesc="A bash implementation of the classic Nibbles game"
arch=('i686' 'x86_64')
url="http://offog.org/code/misccode.html"
license=('MIT')
depends=('bash')
install=$pkgname.install
source=(http://offog.org/darcs/misccode/nibbles.sh
        http://offog.org/darcs/misccode/NOTES)
md5sums=('f91ffb90f462a695ea97e3015ddb0120'
         'f1a4f370d7a9bfb025a38065631141fb')

build() {
  cd "$srcdir"
  sed -e "95 i\[ ! -d ~/.$pkgname ] && install -dm755 ~/.$pkgname" \
      -e "s#~/.#&$pkgname/#g" -i nibbles.sh
  sed -n '23,40 p' NOTES > LICENSE
  install -Dm755 nibbles.sh "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
