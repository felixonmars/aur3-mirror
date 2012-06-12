pkgname=feedtomail-git
pkgver=0.13
pkgrel=1
pkgdesc="A tool to convert RSS feed to email."
arch=('i686' 'x86_64')
license=('WTFPL')
url="http://repo.or.cz/w/feedtomail.git"
depends=('mxml')
makedepends=('git')

build() {
	cd "$srcdir"
	if [[ -d "$pkgname" ]]; then
		cd "$pkgname"
		git pull
	else
		git clone --depth 1 "git://repo.or.cz/feedtomail.git" "$pkgname"
		cd "$pkgname"
	fi
	make
}

package() {
	cd "$srcdir/$pkgname"
	mkdir -p "$pkgdir/usr/bin"
	make DESTDIR="$pkgdir/usr/bin" install
}

