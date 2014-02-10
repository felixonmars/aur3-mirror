# Maintainer: Taylor Hedberg <t@tmh.cc>

# PGP-verbose-MIME patch from http://www.doorstop.net/mutt/patch-1.5.4.vk.pgp_verbose_mime

pkgname=mutt-pgp-verbose-mime
pkgver=1.5.22
pkgrel=1
pkgdesc='Small but very powerful text-based mail client, patched to automatically add a filename and description to PGP/MIME attachments'
url='http://www.mutt.org/'
license=('GPL')
backup=('etc/Muttrc')
arch=('i686' 'x86_64')
optdepends=('smtp-forwarder: to send mail')
depends=('gpgme' 'ncurses' 'openssl' 'libsasl' 'gdbm' 'libidn' 'mime-types' 'krb5')
source=("ftp://ftp.mutt.org/mutt/devel/mutt-${pkgver}.tar.gz" patch-1.5.4.vk.pgp_verbose_mime)
sha1sums=('728a114cb3a44df373dbf1292fc34dd8321057dc'
          'c1b18d74c81eea28a3974035ea42f262e7e3beed')
install=install
provides=(mutt)
conflicts=(mutt)

build() {
	cd "${srcdir}/mutt-${pkgver}"

    msg2 'Patching PGP-verbose-MIME...'
    patch -p1 <$srcdir/patch-1.5.4.vk.pgp_verbose_mime

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
