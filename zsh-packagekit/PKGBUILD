# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=zsh-packagekit
pkgver=0.1
pkgrel=1
pkgdesc="ZSH autocompletion for PackageKit command line utilities"
arch=(any)
url="https://github.com/mtorromeo/zsh-packagekit"
license=('BSD')
depends=(zsh)
source=("$pkgname-$pkgver.tar.gz::https://github.com/mtorromeo/$pkgname/tarball/v$pkgver")

build() {
	cd "$srcdir/mtorromeo-$pkgname-75b99ea"
	install -m0644 -D site-functions/_pkcon $pkgdir/usr/share/zsh/site-functions/_pkcon
	install -D LICENSE $pkgdir/usr/share/licenses/$pkgname/COPYING
}

md5sums=('65963b188d66797efc7b14ed0fb2a3d0')
