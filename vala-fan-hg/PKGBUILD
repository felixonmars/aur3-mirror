# Contributer: Piotr Husiatyński <phusiatynski@gmail.com>

pkgname='vala-fan-hg'
pkgver=8
pkgrel=1
pkgdesc="Macbook cooler speed controller"
url="http://bitbucket.org/Husio/vala-fan/wiki/Home"
license='GPL2'
arch=('i686' 'x86_64')
depends=('vala>=0.7.3' 'libgee')
makedepends=('mercurial' 'python')
install=vala-fan-hg.install
source=()
md5sums=()

_hgroot='http://bitbucket.org/Husio/'
_hgrepo='vala-fan'

build() {
	cd $startdir/src
	if [ -d $_hgrepo ]; then
		cd $_hgrepo
		make clean
		hg pull -u
	else
		hg clone ${_hgroot}/${_hgrepo}
		cd $_hgrepo
	fi
	msg "Starting build process."
	./waf configure --prefix=/usr || return 1
    ./waf || return 1
    ./waf install --destdir="$pkgdir" || return 1 
}
