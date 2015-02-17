# Maintainer: Your Name <youremail@domain.com>
_name=phantom
_pkgname=$_name-engine
pkgname=$_pkgname-git
pkgver=r4.f344e5b
pkgrel=1
pkgdesc="Phantom scalable I/O engine"
arch=("i686" "x86_64")
url="http://github.com/mamchits/phantom"
license=('LGPL2.1')
depends=('openssl')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=('git+https://github.com/mamchits/phantom.git'
        'phantom.patch')
md5sums=('SKIP'
         '578499f0bec68c4e74c20fc2d3b9568c')

pkgver() {
	cd "$srcdir/${_name}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${_name}"
	patch -p1 -i "$srcdir/${_name}.patch"
}

build() {
	cd "$srcdir/${_name}"
	make -R
}

package() {
	cd "$srcdir/${_name}"
    install -d "$pkgdir/usr/bin" "$pkgdir/usr/lib/phantom"
	install bin/phantom "$pkgdir/usr/bin"
    install lib/phantom/*.so "$pkgdir/usr/lib/phantom"
}
