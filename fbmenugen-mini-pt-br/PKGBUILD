# Maintainer: Lara Maia <lara@craft.net.br>

pkgname=fbmenugen-mini-pt-br
pkgver=0.75
pkgrel=2
pkgdesc="A simple menu generator for the Fluxbox. (pt_BR version without extensive help)"
arch=('any')
url="http://lara.craft.net.br"
license=('GPL')
conflicts=('fbmenugen')
provides=('fbmenugen')
depends=('perl>=5.14.0' 'fluxbox' 'perl-data-dump' 'perl-linux-desktopfiles>=0.08')
source="http://lara.craft.net.br/$pkgname.tar.bz2"
md5sums=('a9620b9c095dc027b21df0b1b068380c')

package() {
  install -Dm 755 "$srcdir"/${pkgname%%-p*} "$pkgdir"/usr/bin/${pkgname%%-p*}
}
