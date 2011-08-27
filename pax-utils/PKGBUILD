# Contributor: sh0 <mee@sh0.org>
## Contributor: Maxwel <msg.maxwel@gmail.com>

pkgname=pax-utils
pkgver=0.2.2
pkgrel=1
pkgdesc='ELF related utils for ELF 32/64 binaries that can check files for security relevant properties'
url='http://hardened.gentoo.org/pax-utils.xml'
arch=('i686' 'x86_64')
license=('GPL')
depends=('bash' 'libcap')
source=("http://distfiles.gentoo.org/distfiles/${pkgname}-${pkgver}.tar.bz2")
md5sums=('93a2e993ec7a83627c39ddf92988e191')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make USE_CAP='yes' || return 1
	make DESTDIR="${pkgdir}" install || return 1
}
