# Contributor: Edgar Merino <emerino@gmail.com>
pkgname=svc
pkgver=0.1
pkgrel=1
pkgdesc="Service Configuration Tool"
arch=('i686' 'x86_64')
url="http://bbs.archlinux.org/viewtopic.php?id=81520"
license=('GPL')
depends=()
source=(_$pkgname $pkgname)
md5sums=('927a640806ce48d2ca2d1886aed72bcf'
         '60cafa5d8b3b4c26fd9486e9ca88d3bb')

build() {
	mkdir -p "$pkgdir/usr/sbin"
	cp "$srcdir/$pkgname" "$pkgdir/usr/sbin/$pkgname"
	if [ -d /usr/share/zsh ]; then
		mkdir -p "$pkgdir/usr/share/zsh/site-functions"
		cp "$srcdir/_$pkgname" "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
	fi
}

