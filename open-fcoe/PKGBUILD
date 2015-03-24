# Maintainer: Christian Hesse <mail@eworm.de>

pkgbase=open-fcoe
pkgname=('libhbaapi' 'libhbalinux' 'fcoe-utils')
pkgver=3.11
pkgrel=3
pkgdesc='Fibre Channel over Ethernet implementation for Linux'
arch=('i686' 'x86_64')
url='http://www.open-fcoe.org/'
license=('GPL')
validpgpkeys=('1EFB3A04BBD6C0DBF64D5B3346A3C53C3D727E07') # Robert Love
source=("http://ftp-osl.osuosl.org/pub/${pkgbase}/${pkgbase}-${pkgver}.tar.gz"{,.sig}
	'fcoe.service'
	'config'
	'automake-init.patch'
	'configure.patch'
	'declaration.patch'
	'include.patch'
	'makefile.patch')
sha256sums=('f698a7ebef3188e9638087d686fd5492cef3c5b23256b3c28131a38e00a917d1'
            'SKIP'
            '679a6f1a0e4abe2517f5a5bdb452696bef4e783c7ff510d8f49fa9b46b07dca0'
            '7e9a81d5caf6827387f19acb7dd5c53e02ab8e08dfa7fdcf92c41c2f0a35716c'
            'f170a50bc9860a16b829a83e166b01d2485ec8999995658a591df926210a40a4'
            'd6c18cefda3f026cdac209189fd6f384a9d3626879803c5335a75a79105b6927'
            '1a49ba2a371b6e78e6640a848059ee19c5f87d46124281ad40fd24070add4d3f'
            '1d9c325efaf6bdca22ff1927c885ca393cca14723acf6946176be475cb914746'
            '923053fb59a546896d6942e109dd66b5b69071dc995f93365adac32236704939')

prepare() {
	cd "${srcdir}/"

	patch -Np1 < "${srcdir}/automake-init.patch"
	patch -Np1 < "${srcdir}/configure.patch"
	patch -Np1 < "${srcdir}/declaration.patch"
	patch -Np1 < "${srcdir}/include.patch"
	patch -Np1 < "${srcdir}/makefile.patch"
}

build() {
	cd "${srcdir}/libHBAAPI/"

	./bootstrap.sh
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc

	make

	export HBAAPI_CFLAGS="-I${srcdir}/libHBAAPI/"
	export HBAAPI_LIBS="-L${srcdir}/libHBAAPI/.libs/ -lHBAAPI -ldl"

	cd "${srcdir}/libhbalinux/"

	./bootstrap.sh
	./configure \
		--prefix=/usr

	make

	export LIBHBALINUX_CFLAGS="-I${srcdir}/libhbalinux/"
	export LIBHBALINUX_LIBS="-L${srcdir}/libhbalinux/.libs/ -ldl"

	cd "${srcdir}/fcoe-utils/"

	./bootstrap.sh
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--sbindir=/usr/bin

	make
}

package_libhbaapi() {
	pkgdesc='Fibre Channel over Ethernet implementation for Linux - libhbaapi'
	backup=('etc/hba.conf')

	cd "${srcdir}/libHBAAPI/"

	make DESTDIR="${pkgdir}" install
}

package_libhbalinux() {
	pkgdesc='Fibre Channel over Ethernet implementation for Linux - libhbalinux'
	depends=('libhbaapi')

	cd "${srcdir}/libhbalinux/"

	make DESTDIR="${pkgdir}" install
}

package_fcoe-utils() {
	pkgdesc='Fibre Channel over Ethernet implementation for Linux - utils'
	depends=('open-lldp' 'libhbaapi' 'libhbalinux')
	optdepends=('bash-completion: command completion in bash')
	backup=('etc/conf.d/fcoe')

	cd "${srcdir}/fcoe-utils/"

	make DESTDIR="${pkgdir}" install

	install -D -m0644 "${srcdir}/fcoe.service" "${pkgdir}/usr/lib/systemd/system/fcoe.service"
	install -D -m0644 "${srcdir}/config" "${pkgdir}/etc/conf.d/fcoe"

	rm -rf "${pkgdir}/etc/init.d/"
	rm -rf "${pkgdir}/etc/fcoe/"
}

