# Contributor: PyrO_70 <brieuc.roblin@gmail.com>
pkgname=libqextserialport-hg
pkgver=105
pkgrel=1
pkgdesc="Cross-platform serial port class libary for Qt4."
arch=('i686' 'x86_64')
url="http://code.google.com/p/qextserialport/"
license="BSD"
depends=(qt)
makedepends=(make gcc mercurial)
provides=(libqextserialport)

_hgrepo="qextserialport"
_hgroot="https://qextserialport.googlecode.com/hg/"

build() {
	cd ${srcdir}

	msg "Downloading source using Mercurial..."
	rm -fr ${_hgrepo} &> /dev/null
	hg clone ${_hgroot} ${_hgrepo} || return 1
	msg "Clone done or server timeout"

	msg "Starting make..."
	cd ${_hgrepo}
	echo "DESTDIR=${pkgdir}/usr/lib" >> src/src.pro
	qmake || return 1
	make sub-src || return 1

	# Installing include
	msg "Installing..."
	mkdir -p "$pkgdir"/usr/include
	install -D -m644 src/*.h "$pkgdir"/usr/include
}
