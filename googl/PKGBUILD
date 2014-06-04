# Contributor: Alexander Foremny <alexanderforemny@gmail.com>
# Maintainer: Acho Arnold <arnold@archlinux.info>

pkgname=googl
pkgver=1.1.0
pkgrel=1
pkgdesc="A command line and GUI interface for the Google url shortener service"
arch=('any')
url="https://github.com/najela/googl"
license=('BSD')
depends=('gtk2')
optdepends=(
	'xsel: automatically putting the URL on the X selection  clipboard for easy pasting'
	'xclip: an alternative to xsel'
)

changelog="change.log"

source=("googl.tar.gz")
md5sums=('d4834c3d191feb5da7a3600d630857c1')


build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="${pkgdir}" install
}