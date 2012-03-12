# Maintainer: fauno <fauno@kiwwwi.com.ar>
# Contributor: Artefact2 <artefact2@gmail.com>
# Contributor: shahid <helllamer@gmail.com>
# Based on bitcoin by
# Maintainer : shahid <helllamer@gmail.com>

pkgname=bitcoin-daemon
_pkgname=bitcoin
pkgver=0.5.2
pkgrel=1
pkgdesc="Bitcoin is a peer-to-peer network based digital currency (daemon with JSON-RPC interface)."
arch=('i686' 'x86_64')
url="http://www.bitcoin.org/"
depends=('expat' 'boost-libs>=1.46' 'miniupnpc>=1.6' 'openssl')
makedepends=('boost' 'gcc' 'make')
conflicts=('bitcoin')
license=('MIT')
install="bitcoin-daemon.install"
source=("http://downloads.sourceforge.net/sourceforge/${_pkgname}/${_pkgname}-${pkgver}-linux.tar.gz"
        bitcoin-daemon.install
        rc.bitcoind)

s1=$srcdir/${_pkgname}-${pkgver}-linux
src=$s1/src/src
makefile_unix=makefile.unix
md5sums=('6d40f645ddc042de26d64e83656f38e0'
         '0375ba4d6c3425eee350dc8b7575403d'
         '7faa439885f3adbba5847ae75aac5484')

build() {
	cd $src

	msg "Patching $makefile_unix..."
	sed -i $makefile_unix \
		-e 's/\(-DNOPCH\)/\1 -DBOOST_FILESYSTEM_VERSION=2/' \
		-e 's/-Bstatic/--as-needed ${LDFLAGS}/g' \
		-e 's/\(USE_UPNP:=\)0/\11/' \
		-e 's/$(DEBUGFLAGS)//g' \
		-e 's/CXXFLAGS/CPPFLAGS/g' \
		-e 's/-O[0-3]/${CXXFLAGS}/g'

	# make bitcoind
	make $MAKEFLAGS -f $makefile_unix bitcoind
}

package() {
	# get compiled binaries
	mkdir -p ${pkgdir}/{var/lib/${pkgname},usr/{share/licenses/${pkgname},bin},etc/rc.d}

	install -D -m755 ${src}/bitcoind ${pkgdir}/usr/bin/

    install -D -m755 ${srcdir}/rc.bitcoind ${pkgdir}/etc/rc.d/

    install -D -m 644 ${s1}/COPYING \
                      ${pkgdir}/usr/share/licenses/${pkgname}/
}
