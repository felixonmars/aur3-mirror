pkgname=mutt-ignore-thread
_pkgname=mutt
pkgver=1.5.21
pkgrel=8
pkgdesc='Small but very powerful text-based mail client with the ignore thread patch.'
url='http://www.mutt.org/'
license=('GPL')
backup=('etc/Muttrc')
arch=('i686' 'x86_64')
optdepends=('smtp-forwarder: to send mail')
depends=('gpgme' 'ncurses' 'openssl' 'libsasl' 'gdbm' 'libidn' 'mime-types' 'krb5')
provides=('mutt')
conflicts=('mutt')
source=("ftp://ftp.mutt.org/mutt/devel/${_pkgname}-${pkgver}.tar.gz"
        'pop-cachedir.patch'
        'crypt-gpgme.patch'
        'ignore-thread-1.5.21.patch')

sha1sums=('a8475f2618ce5d5d33bff85c0affdf21ab1d76b9'
          '32dbcafe05e4a919fd00c6a1064c6ecd205e6eb1'
          '8cf0d4278aab1d162ab7f847f1b917327d630d98'
          'e414b00fe5b9decfb7644935224b22520128bec7')

install=install

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	patch -i ../pop-cachedir.patch # FS#31536
	patch -p1 -i ../crypt-gpgme.patch # FS#31735

	# From http://ben.at.tanjero.com/patches/ignore-thread-1.5.21.patch
	patch -p1 -i "../ignore-thread-1.5.21.patch"

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
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install

	rm "${pkgdir}"/usr/bin/{flea,muttbug}
	rm "${pkgdir}"/usr/share/man/man1/{flea,muttbug}.1
	rm "${pkgdir}"/etc/mime.types{,.dist}
	install -Dm644 contrib/gpg.rc "${pkgdir}"/etc/Muttrc.gpg.dist
}
