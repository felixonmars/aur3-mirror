# $Id: PKGBUILD 143812 2011-11-29 13:33:33Z stephane $
# Contributor: tobias [tobias [at] archlinux.org]
# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=mutt-android-patch
pkgver=1.5.21
pkgrel=8
pkgdesc='Mutt from Arch Linux with fix for Android MUA.'
url='http://www.mutt.org/'
license=('GPL')
backup=('etc/Muttrc')
arch=('i686' 'x86_64')
optdepends=('smtp-forwarder: to send mail')
depends=('gpgme' 'ncurses' 'openssl' 'libsasl' 'gdbm' 'libidn' 'mime-types' 'krb5')
provides=('mutt')
conflicts=('mutt')
source=("ftp://ftp.mutt.org/mutt/devel/mutt-${pkgver}.tar.gz"
        "mutt-android-patch.patch")
sha1sums=('a8475f2618ce5d5d33bff85c0affdf21ab1d76b9'
          '14e2a9db139565da26592488ac6cb814ce07ffd5')

install=install

build() {
	cd "${srcdir}/mutt-${pkgver}"
    
    ## Android patch
    patch -p1 -i ${srcdir}/${pkgname}.patch

	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--enable-gpgme \
		--enable-pop \
		--enable-imap \
		--enable-smtp \
		--enable-hcache \
		--with-curses=/usr \
		--with-regex \
		--with-gss=/usr \
		--with-ssl=/usr \
		--with-sasl \
		--with-idn \

	make
}

package() {
	cd "${srcdir}/mutt-${pkgver}"
	make DESTDIR="${pkgdir}" install

	rm "${pkgdir}"/usr/bin/{flea,muttbug}
	rm "${pkgdir}"/usr/share/man/man1/{flea,muttbug}.1
	rm "${pkgdir}"/etc/mime.types{,.dist}
	install -Dm644 contrib/gpg.rc "${pkgdir}"/etc/Muttrc.gpg.dist
}
