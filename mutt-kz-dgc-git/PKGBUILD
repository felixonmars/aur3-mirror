# Maintainer: Ethan Schoonover <es@ethanschoonover.com>
pkgname=mutt-kz-dgc-git
pkgver=20130117
pkgrel=1
pkgdesc='Mutt text-based mail client with native notmuch support and the DGC patch queue inc. nested_if and date_conditional'
url="http://github.com/karelzak/mutt-kz"
# nb: patch queue is from "http://bitbucket.org/dgc/mutt-dgc"
license=('GPL')
backup=('etc/Muttrc')
arch=('i686' 'x86_64')
depends=('openssl>=0.9.8e' 'gpgme' 'libidn' 'mime-types' 'krb5' 'gdbm' 'mime-types' 'zlib' 'libsasl' 'gpgme' 'ncurses' 'notmuch')
makedepends=('git' 'gnupg' 'libxslt')
optdepends=('smtp-forwarder: to send mail')
options=('!strip')
conflicts=('mutt')
provides=('mutt')
_gitroot=git://github.com/karelzak/mutt-kz.git
_gitname=muttkz
source=('crypt-gpgme.patch'
	'hashwalk'
	'replacelist'
	'subjectrx'
	'obfuscat'
	'whitespaceok'
	'dgc.flagsafe'
	'dgc.groupalts'
	'dgc.isalias'
	'dgc.markmsg'
	'dgc.setenv'
	'dgc.uncollapsenew'
	'ats.date_conditional'
	'dgc.nested_if.2')
md5sums=('6cb5b3ca56bd03c00c6768864070a2d4'
         'ea85c7292c6667a56da2e6daf3a578b3'
         'c084ee060a2b9f2ab8ceed95aad467b9'
         'cd9e2f64ae90fb6be1fcfb13ad086841'
         '877b23545fd6ece7784d9f2b83cd5c40'
         '085a54878e43ec24e437671610624cc9'
         'bde23be53f25979ea4ebc792a3c2f123'
         'c6c435c37f5afdbb1cad0a47b370af87'
         '8d5e1222874fd81cbd6603daf68f8e73'
         'c4505295ccd8fcdd10e60a3ba81f311f'
         '3af89a7d774ddbe4a352842c63150d38'
         '5bf0a5d21c42603d2c532ae8fafef5cb'
         'a78547e7bdf74c2938847bc4df97098a'
         '0af9052518d6e68b32e45a5804b08a52')

install=install

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."
	if [[ -d "$_gitname" ]]; then
		cd "$_gitname" && git pull origin
		msg "The local files are updated."
	else
		git clone "$_gitroot" "$_gitname"
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting build..."

	rm -rf "$srcdir/$_gitname-build"
	git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	cd "$srcdir/$_gitname-build"

	sed -i 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/g' configure.ac

	for patchfile in \
		crypt-gpgme.patch \
		hashwalk \
		replacelist \
		subjectrx \
		obfuscat \
		whitespaceok \
		dgc.flagsafe \
		dgc.groupalts \
		dgc.isalias \
		dgc.markmsg \
		dgc.setenv \
		dgc.uncollapsenew \
		ats.date_conditional \
		dgc.nested_if.2;
	do
                echo "CURRENT PATCHFILE IS $patchfile"
		patch -p1 -i ../$patchfile
	done

	./prepare \
	--prefix=/usr \
	--sysconfdir=/etc \
	--enable-debug \
	--enable-gpgme \
	--enable-hcache \
	--enable-imap \
	--enable-notmuch \
	--enable-pgp \
	--enable-pop \
	--enable-smtp \
	--with-idn \
	--with-sasl \
	--with-ssl=/usr \
	--with-curses=/usr \
	--with-regex \
	--with-gss=/usr \
	--with-sasl \
	--with-idn \
	;
	make

}

package() {
	cd "$srcdir/$_gitname-build"
	make DESTDIR="$pkgdir/" install
	rm "${pkgdir}"/etc/mime.types{,.dist}
	install -Dm644 contrib/gpg.rc ${pkgdir}/etc/Muttrc.gpg.dist
}
