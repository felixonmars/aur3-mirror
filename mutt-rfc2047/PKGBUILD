## PKGBUILD [plain_text]
# Contributor: tobias [tobias [at] archlinux.org]

pkgname=mutt-rfc2047
pkgver=1.5.21
pkgrel=9
pkgdesc='Small but very powerful text-based mail client, with create_rfc2047_parameters and sidebar patch'
url='http://www.mutt.org/'
license=('GPL')
backup=('etc/Muttrc')
arch=('i686' 'x86_64')
conflicts=('mutt')
optdepends=('smtp-forwarder: to send mail')
depends=('gpgme' 'ncurses' 'openssl' 'libsasl' 'gdbm' 'libidn' 'mime-types' 'krb5')
provides=('mutt')
conflicts=('mutt')
source=("ftp://ftp.mutt.org/mutt/devel/mutt-${pkgver}.tar.gz"
"pop-cachedir.patch"
"crypt-gpgme.patch"
"http://www.emaillab.org/mutt/${pkgver}/patch-${pkgver}.tt.create_rfc2047_params.1.gz"
"http://dbg.download.sourcemage.org/grimoire/codex/stable/mail/mutt/patches/trash_folder/trash_folder-1.5.18.patch.bz2"
"http://lunar-linux.org/~tchan/mutt/patch-1.5.21.sidebar.20130219.txt"
)

sha1sums=('a8475f2618ce5d5d33bff85c0affdf21ab1d76b9'
          '32dbcafe05e4a919fd00c6a1064c6ecd205e6eb1'
          '8cf0d4278aab1d162ab7f847f1b917327d630d98'
          'd85a7a1e5590af9e6b54260bffd10d1f0ee82243'
          '33037a91443aa4b0a510b4250dd4bead3a697aee'
          '54ed2f1f446232c2fb4936a454ea84b089c2f415')

build() {
        cd "${srcdir}/mutt-${pkgver}"

        patch -i ../pop-cachedir.patch # FS#3
        patch -p1 -i ../crypt-gpgme.patch # FS#31735
        patch -Np1 -i ../patch-${pkgver}.tt.create_rfc2047_params.1


        msg "Patching... Sidebar"
        patch -p1 -i ${srcdir}/patch-1.5.21.sidebar.20130219.txt

        msg "Patching... Trashfolder"
        patch -p1 -i ${srcdir}/trash_folder-1.5.18.patch

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
