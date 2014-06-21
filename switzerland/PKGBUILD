# Maintainer: Brad Conte <brad AT bradconte DOT com>

pkgname=switzerland
pkgver=0.1.0
pkgrel=3
#epoch=
pkgdesc="A client/server program by the EFF to detect when ISPs, networks, or firewalls interfere with Internet traffic."
arch=('i686' 'x86_64')
url="http://www.eff.org/testyourisp/switzerland"
license=('GPL')
groups=()
depends=(python2 libpcap ntp)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
#install=
#changelog=
source=("http://download.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tgz")
noextract=()
sha512sums=('3a5474c005bf45cddf8eede7c1e2faa5855bf9017f5c732555cfe2c8b7b82381ea25c2ada000a9945a330ff3af19f1e861a11508ff057c81a78eab53de1d0cdb')

#prepare() {
#}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make || return 1
}

#check() {
#}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python2 setup.py install --root="$pkgdir/"
}
