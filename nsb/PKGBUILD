# Contributor: Kamil Stachowski <kamil.stachowski@gmail.com>

pkgname=nsb
pkgver=20090712
pkgrel=1
pkgdesc="named stage backup"
url='http://github.com/caminoix/nsb/tree/master'
arch=('i686' 'x86_64')
license=('GPL')
depends=()
makedepends=('git')
optdepends=()
provides=('nsb')
conflicts=()
replaces=()
source=()
md5sums=()
install=$pkgname.install

_gitroot='git://github.com/caminoix/nsb.git'

build() {
	msg "Connecting to Git server..."
	if [ -d "$srcdir/$pkgname" ]; then
		cd "$srcdir/$pkgname" && git pull origin || return 1
	else
		git clone "$_gitroot" || return 1
	fi
	msg "Git checkout done or server timeout"

	install -D -m755 "$srcdir/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -D -m644 "$srcdir/$pkgname/$pkgname.conf.sample" "$pkgdir/etc/$pkgname.conf.sample"
}
