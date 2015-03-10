# Maintainer: ajs124 < aur ÄT ajs124 DOT de>

pkgname=blocks-git
pkgver=r167.d00d8aa
pkgrel=1
pkgdesc="Enable bcache or LVM on existing block devices"
arch=(any)
url="https://github.com/g2p/blocks"
license=('GPL')
depends=('bcache-tools' 'python-parted' 'python-augeas')
makedepends=('git' 'python-setuptools')
source=('git+https://github.com/g2p/blocks.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	sed -i '/maintboot/d' setup.py
	python setup.py install --root="$pkgdir/" --optimize=1
}
