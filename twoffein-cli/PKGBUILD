# Maintainer: Malte Bublitz <me@malte-bublitz.de>

pkgname=twoffein-cli
pkgver=0.20121209
pkgrel=1
pkgdesc="A command line client for twoffein.com"
arch=(any)
url="https://github.com/malte70/twoffein-cli"
license=(BSD)
depends=(python2)
makedepends=("python2-distribute")
source=("https://raw.github.com/malte70/twoffein-cli/cf977ae5d594e138e3a64961e4e4a8be7b050ccb/twoffein-cli.py")

package() {
	cd "${srcdir}"
	install -d $pkgdir/usr/bin
	install twoffein-cli.py $pkgdir/usr/bin
}
md5sums=('b5b3be7a29f9902628dd424bff1186e6')
