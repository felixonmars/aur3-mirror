pkgname=mutt-trash-purge
_pkgname=mutt
pkgver=1.5.23
pkgrel=1
pkgdesc='Small but very powerful text-based mail client with trash folder and purge message patches.'
url='http://www.mutt.org/'
license=('GPL')
backup=('etc/Muttrc')
arch=('i686' 'x86_64')
optdepends=('smtp-forwarder: to send mail')
depends=('gpgme' 'ncurses' 'openssl' 'libsasl' 'gdbm' 'libidn' 'mime-types' 'krb5')
provides=('mutt')
conflicts=('mutt')
source=("ftp://ftp.mutt.org/mutt/devel/${_pkgname}-${pkgver}.tar.gz"
        'trash_folder.patch'
        'purge_message.patch')

sha1sums=('8ac821d8b1e25504a31bf5fda9c08d93a4acc862'
          '9de16f379d7583a55e48623ea052cd28ed32eecf'
          '4f894278370edfa1498c5121e0ab073d80500829')

install=install

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	patch -p1 -i ../trash_folder.patch
	patch -p1 -i ../purge_message.patch

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
		--with-idn

	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install

	rm "${pkgdir}"/etc/mime.types{,.dist}
	rm "${pkgdir}"/usr/bin/{flea,muttbug}
	rm "${pkgdir}"/usr/share/man/man1/{flea,muttbug}.1
	install -Dm644 contrib/gpg.rc "${pkgdir}"/etc/Muttrc.gpg.dist
}
