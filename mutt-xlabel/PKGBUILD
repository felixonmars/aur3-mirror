# Maintainer: Chase Geigle <sky@skystrife.com>
pkgname=mutt-xlabel
_pkgname=mutt
pkgver=1.5.23
pkgrel=1
epoch=
pkgdesc="Small but very powerful text-based mail client with xlabel-ext patch"
arch=('i686' 'x86_64')
url="https://www.mutt.org"
license=('GPL')
depends=('gpgme' 'ncurses' 'libidn' 'krb5')
provides=('mutt')
conflicts=('mutt')
replaces=()
backup=('etc/Muttrc')
install=$pkgname.install
source=(https://bitbucket.org/$_pkgname/$_pkgname/downloads/$_pkgname-$pkgver.tar.gz
        https://bitbucket.org/dgc/mutt-dgc/raw/42d6f8d629ad3f0ceb7f4790013d3cec665d0df6/dgc.xlabel_ext)
sha1sums=('8ac821d8b1e25504a31bf5fda9c08d93a4acc862'
          'ee3dafbc1107aeaa65b95c676e114fb75d898368')

prepare() {
	cd "$srcdir/$_pkgname-$pkgver"
	patch -p1 -i "$srcdir/dgc.xlabel_ext"
}

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	./configure --prefix=/usr --sysconfdir=/etc --enable-gpgme \
	--enable-pop --enable-imap --enable-smtp --enable-hcache \
	--with-curses=/usr --with-regex --with-gss=/usr --with-ssl=/usr \
	--with-sasl --with-idn
	make
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install

	rm "$pkgdir"/usr/bin/{flea,muttbug}
	rm "$pkgdir"/usr/share/man/man1/{flea,muttbug}.1
	rm "$pkgdir"/etc/mime.types{,.dist}

	install -Dm644 contrib/gpg.rc "$pkgdir"/etc/Muttrc.gpg.dist
}
