# Maintainer: Gicu Gorodenco <cyclopsihus@gmail.com>
# Contributor: MaLiK <malik_cjm@o2.pl>
# Contributor: dpevp <daniel.plaza.espi@gmail.com>
# Contributor: Magnus Therning <magnus@therning.org>
# Contributor: Anthony <anthony@littlegno.me>

pkgname=pidgin-sipe
pkgver=1.18.2
pkgrel=1
pkgdesc="An Open Implementation of SIP/Simple protocol for Live Communications Server 2003/2005/2007 - Pidgin plugin"
arch=(i686 x86_64)
license=('GPL')
url="http://sipe.sourceforge.net/"
depends=('glib2' 'gtk2' 'gmime' 'gettext' 'libpurple' 'nss')
makedepends=('pkgconfig' 'intltool' 'nss')
options=('!libtool' '!buildflags')
source=(
	http://downloads.sourceforge.net/project/sipe/sipe/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.bz2
	)
sha256sums=(
	'd843db4c97af7a7f423ffd38116e1090cd688029ba8d831c7e5147c4caea1869'
	)

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	export CFLAGS="${CFLAGS} -Wno-error=unused-but-set-variable -Wno-error=uninitialized -Wno-error=unused-local-typedefs"
	# Enable Kerberos 5 and libpurple support, and disable built-in telepathy support
	./configure --prefix=/usr \
		--with-krb5 \
		--enable-purple \
		--disable-telepathy
	make || return 1
}

package() {
        cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install || return 1
}
