# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=zsh-virtualbox
pkgver=0.2
pkgrel=2
pkgdesc="ZSH autocompletion definitions for the Oracle VirtualBox command line utilities"
arch=(any)
url="https://github.com/mtorromeo/zsh-virtualbox"
license=('BSD')
depends=(zsh)
source=("$pkgname-$pkgver.tar.gz::https://github.com/mtorromeo/$pkgname/tarball/v$pkgver")

build() {
	cd "$srcdir/mtorromeo-$pkgname-ed0c917"
	install -m0755 -d "$pkgdir/usr/share/zsh/site-functions"
	install -m0644 site-functions/* "$pkgdir/usr/share/zsh/site-functions"
	install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

md5sums=('9adf10ecab84cea0d1c64de02b36b04b')
