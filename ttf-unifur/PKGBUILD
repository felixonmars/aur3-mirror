# Maintainer: TDY <tdy@gmx.com>

pkgname=ttf-unifur
pkgver=1.0
pkgrel=2
pkgdesc="A display font for book titles, ad slogans, logos, et al."
arch=('i686' 'x86_64')
url="http://www.eurofurence.net/unifur.html"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://www.eurofurence.net/unifurtt.zip)
md5sums=('4a134167a9341cb63ed80b532412e5a2')

build() {
  cd "$srcdir"
  install -Dm644 unifur.ttf "$pkgdir/usr/share/fonts/TTF/unifur.ttf"
  install -Dm644 unifurtt.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
