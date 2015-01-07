# Maintainer: Jon Gjengset <jon@tsp.io>
pkgname=songtext-git
pkgver=r6.a91257a
pkgrel=1
pkgdesc="bash script for retrieving song lyrics."
arch=('any')
url="https://github.com/jonhoo/songtext"
license=('MIT')
groups=()
depends=('pup')
makedepends=('git')
source=('git+https://github.com/jonhoo/songtext.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 "songtext" "$pkgdir/usr/bin/songtext"
}
