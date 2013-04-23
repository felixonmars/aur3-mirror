# Maintainer: Andre Osku Schmidt <andre.osku.schmidt@gmail.com>

pkgname=treecat
pkgver=0.2
pkgrel=1
epoch=
pkgdesc='list directory tree and content or type of files'
arch=('any')
url='https://github.com/oskude/treecat'
license=('TODO')
groups=()
depends=('bash')
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://github.com/oskude/$pkgname/archive/v${pkgver}.zip)
noextract=()
md5sums=('8f3bd8d836e398c6bb727832a9f915b6')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin/"
	cp treecat "$pkgdir/usr/bin/"
}

