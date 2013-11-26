# Maintainer: Andrew Grigorev <andrew@ei-grad.ru>

pkgname=trinkup
pkgver=0.1
pkgrel=1
pkgdesc="TRivial INcremental bacKUP script"
arch=('i686' 'x86_64')
url="https://gist.github.com/ei-grad/7610406/raw/trinkup"
license=('custom')
depends=('rsync')
makedepends=('curl')
source=($url)
md5sums=('8734d0329d08f2f1af84c352f92bc231')

package() {
	install -Dm755 "$srcdir/trinkup" "$pkgdir/usr/bin/trinkup"
}
