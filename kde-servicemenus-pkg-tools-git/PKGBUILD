# Maintainer: udeved <udeved@openrc4arch.site40.net>

pkgname=kde-servicemenus-pkg-tools-git
pkgver=0.r103.2c484c6
pkgrel=1
pkgdesc="Servicemenu for makepkg, pactree graph, local repo, namcap & aur upload."
arch=('any')
url="https://github.com/udeved/kde-servicemenus-pkg-tools"
license=('GPL2')
depends=('kdebase-kdialog' 'namcap' 'graphviz' 'pkgbuild-introspection' 'curl')
makedepends=('git')
conflicts=('kde-servicemenus-pkg-tools')
install=pkg-tools.install
source=("$pkgname"::'git://github.com/udeved/kde-servicemenu-pkg-tools.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd ${srcdir}/${pkgname}
	make PREFIX=/usr
}

package() {
	cd ${srcdir}/${pkgname}
	make PREFIX=/usr DESTDIR=${pkgdir} install
}
