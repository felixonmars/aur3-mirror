# Maintainer: Louis Tim Larsen <louis(a)louis.dk>
pkgname=drnuget
pkgver=20140606
pkgrel=1
pkgdesc="Script to download tv programs from http://www.dr.dk/tv/"
arch=(any)
url="https://gist.github.com/klausenbusk/9ece67406f35def55169"
license=('unknown')
depends=('curl')
source=("https://gist.githubusercontent.com/klausenbusk/9ece67406f35def55169/raw/a8ca1ff85c39002d329d2b6869985e2f0701cfd3/$pkgname")
md5sums=('b8ca77acfc67112aae7e833b4592d131')

package () {
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
