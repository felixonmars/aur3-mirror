# package for aircrack with patchset from gentoo
# contributor: hadzhimurad ustarkhan - hmurad dot ust at gmail dot com

pkgbase=aircrack-ng
pkgname=aircrack-ng-nosqlite
pkgdesc="Wifi security suite - WEP / WPA crack tools - without SQLITE and with patches."
pkgver=1.1
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.aircrack-ng.org"
license=('GPL2')
depends=('openssl' 'iw')
provides=('aircrack-ng' 'aircrack-ng-nosqlite')
replaces=('aircrack-ng')
conflicts=('aircrack-ng')
source=("http://download.aircrack-ng.org/${pkgbase}-${pkgver}.tar.gz"
        "patches.tar")
md5sums=('f7a24ed8fad122c4187d06bfd6f998b4'
         '8cc2f2043588c18f0d0fc2868c62c618')

build() {

	cd ${srcdir}/${pkgbase}-${pkgver}

	msg "Applying patches ..."
	patch -Np0 -i "${srcdir}/aircrack-ng-1.1-respect_LDFLAGS.patch"
	patch -Np1 -i "${srcdir}/airodump-ng-oui-update-path-fix.patch"
	patch -Np1 -i "${srcdir}/changeset_r1921_backport.diff"
	patch -Np0 -i "${srcdir}/eapol_fix.patch"
	patch -Np0 -i "${srcdir}/diff-wpa-migration-mode-aircrack-ng.diff"
	patch -Np0 -i "${srcdir}/ignore-channel-1-error.patch"
	patch -Np0 -i "${srcdir}/airodump-ng.ignore-negative-one.v4.patch"
	patch -Np1 -i "${srcdir}/pic-fix.patch"

	make DESTDIR=${pkgdir} SQLITE=false unstable=true bindir=/usr/bin  \
		mandir=/usr/share/man/man1 sbindir=/usr/sbin install

	### Remove installed scripts/corresponding man pages (installed in aircrack-ng-scripts) ###
	# Scripts
	rm ${pkgdir}/usr/sbin/airdriver-ng
	rm ${pkgdir}/usr/sbin/airodump-ng-oui-update
	rm ${pkgdir}/usr/share/man/man1/airdriver-ng.1
}
