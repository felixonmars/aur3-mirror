# Maintainer: David Costa <david at zarel dot net>

pkgname=keynav-git
_gitname=keynav
pkgrel=1
pkgver=20140218
pkgdesc="Ingenious and fast way to move the (mouse) pointer on the screen with keystrokes."
arch=('i686' 'x86_64')
url="http://www.semicomplete.com/projects/keynav"
license=('BSD')
depends=('xdotool-git')
makedepends=('git' 'perl')
provides=('keynav')
conflicts=('keynav')
source=('git+https://github.com/jordansissel/keynav.git')
md5sums=('SKIP')

build(){
	cd $_gitname
	make keynav
	make keynav.1
}

package(){
	cd $_gitname
	install -D keynav	"$pkgdir/usr/bin/keynav"
	install -D keynavrc	"$pkgdir/etc/keynav/keynavrc"
	install -D keynav.1	"$pkgdir/usr/share/man/man1/keynav.1"
}
