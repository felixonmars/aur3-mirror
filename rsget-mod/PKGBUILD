
pkgname=rsget-mod
pkgver=0.6
pkgrel=1
pkgdesc="A script for downloading files from rapidshare (modded rsget.sh)"
arch=('any')
url="http://rs.nerdblog.pl"
license=('WTFPL2')
depends=('wget' 'grep' 'sed')
optdepends=('curl: optional download manager') 
provides=('rsget')
conflicts=('rsget')
source=(http://rs.nerdblog.pl/stable/latest/${pkgname}.sh)
md5sums=('2726c61bf99c6ede0f7e556cb49a8250')

build() {
  install -Dm755 $srcdir/rsget-mod.sh $pkgdir/usr/bin/rsget
}
