# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=newpid
pkgver=4
pkgrel=1
pkgdesc="launch a command in a new PID namespace"
arch=('i686' 'x86_64')
url="https://github.com/ChristophBerg/newpid"
license=('MIT')
depends=('glibc')
source=("https://github.com/ChristophBerg/newpid/archive/${pkgver}.tar.gz")

build() {
	cd "${srcdir}/newpid-${pkgver}"
	make
}

package() {
	cd "${srcdir}/newpid-${pkgver}"
	make DESTDIR="${pkgdir}" install
	
	install -Dm644 debian/copyright "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
}

md5sums=('14ba45f6add5031c2830801b6321855d')
