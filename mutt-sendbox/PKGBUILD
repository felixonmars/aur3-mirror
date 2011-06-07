# Maintainer : Nicolas Estibals <Nicolas.Estibals@gmail.com>
# Contributor: tobias [tobias [at] archlinux.org]
# Contributor: Gaetan Bisson <bisson@archlinux.org>
pkgname=mutt-sendbox
pkgver=1.5.21
pkgrel=3
pkgdesc="Small but very powerful text-based mail client with patch of Aron Griffis for Courrier IMAP's outbox feature."
url='http://www.mutt.org/'
license=('GPL')
backup=('etc/Muttrc')
arch=('i686' 'x86_64')
depends=('gpgme' 'ncurses' 'openssl' 'libsasl' 'gdbm' 'libidn' 'mime-types' 'krb5')
conflicts=('mutt')
source=("ftp://ftp.mutt.org/mutt/devel/mutt-${pkgver}.tar.gz"
        "mutt-resent-header-weeding.patch"
        "mutt-sendbox-bounce.patch"
        "mutt-sendbox.patch"
        "mutt-write_postponed.patch")
sha1sums=('a8475f2618ce5d5d33bff85c0affdf21ab1d76b9'
          'f48b04c1c0c4d6ebb1c55da247bb2277843a011e'
          '27b0bccfc5187db744f4da99bc39c4ce985ebe6d'
          '6444fabd4fde65151d1bfcedec8a13a50e521d41'
          'fd66bfc85df26803333f88eab2721a254492bab6')
install=install

build() {
	cd "${srcdir}/mutt-${pkgver}"
	patch -p1 < ../mutt-write_postponed.patch
	patch -p1 < ../mutt-resent-header-weeding.patch
	patch -p1 < ../mutt-sendbox.patch
	patch -p1 < ../mutt-sendbox-bounce.patch
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--enable-gpgme \
		--enable-pop \
		--enable-imap \
		--enable-smtp \
		--enable-hcache \
		--enable-sendbox \
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
