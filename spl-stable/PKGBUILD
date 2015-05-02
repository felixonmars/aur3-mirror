# Maintainer: billybigrigger <billy dot big dot rigger at hotmail dot com>
pkgname=spl-stable
pkgver=0.6.4.1
pkgrel=1
epoch=
pkgdesc="Solaris Porting Layer kernel modules."
arch=("x86_64")
url="http://http://zfsonlinux.org/"
license=('GPL')
groups=()
depends=()
makedepends=(git)
checkdepends=()
optdepends=()
provides=(spl)
conflicts=(spl-dkms-git spl-git)
replaces=()
backup=()
options=()
install=
changelog=
source=("http://archive.zfsonlinux.org/downloads/zfsonlinux/spl/spl-0.6.4.1.tar.gz")
noextract=()
sha256sums=("a177a6b988dc4358ca0df785c0fb120c4cfd48154822f4a8912f50b9a8d74ca7")
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	./configure
	make
}

#check() {
#	cd "$pkgname-$pkgver"
#	make -k check
#}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
