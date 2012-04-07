pkgname=capability-helper
pkgver=0.1
pkgrel=1
pkgdesc="Helper configuration and scripts for non-setuid package variant install-scripts"
arch=('i686' 'x86_64')
license=('WTFPL')
url="https://github.com/Blub/capability-helper"
makedepends=('make')
depends=('libcap' 'sh' 'grep' 'sed')
source=( http://downloads.sourceforge.net/project/capinstall/v0.1/$pkgname-$pkgver.tar.xz )
md5sums=('60055dcb8494a20593686e736fa3cefe')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

# TODO:
#check() {
#}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
