# Maintainer: Sam Whited 4096R/54083AE104EA7AD3 <sam@samwhited.com>

pkgname=photoshell-git
pkgver=0.0.0
pkgrel=1
pkgdesc="An application for viewing and managing raw photo libraries."
arch=('i686' 'x86_64')
url="https://github.com/photoshell/photoshell"
license=('MIT')
depends=('python' 'dcraw')
makedepends=('git' 'make' 'inkscape' 'python-pip')
conflicts=('photoshell')
provides=('photoshell')
INTEGRITY_CHECK=('sha256')
sha256sums=('SKIP')

source=(
"git://github.com/photoshell/photoshell.git"
)

pkgver(){
	cd "${srcdir}/photoshell"
	git describe --tags --dirty
}

build(){
  cd "${srcdir}/photoshell"
	make build
}

package() {
  cd "${srcdir}/photoshell"

	pip install --install-option="--prefix=${pkgdir}" \
		${srcdir}/photoshell/ --ignore-installed
}
