# Maintainer: Florian kellmer <floyd [at] hackify [dot] de>
# Took mutt-sidebar PKGBUILD as base for this PKGBUILD

pkgname=mutt-gentoo
pkgver=1.5.23
pkgrel=1
pkgdesc='Small but very powerful text-based mail client with Gentoo patches - Included sidebar,
trash-folder and nntp'
arch=('i686' 'x86_64')
url='http://www.mutt.org/'
license=('GPL')
depends=('gpgme' 'krb5' 'libidn' 'mime-types')
optdepends=('smtp-forwarder: to send mail')
conflicts=('mutt')
provides=('mutt')
source=("https://bitbucket.org/mutt/mutt/downloads/mutt-${pkgver}.tar.gz"
        "http://dev.gentoo.org/~grobian/distfiles/mutt-${pkgver}-gentoo-patches-r2.tar.bz2")
md5sums=('11f5b6a3eeba1afa1257fe93c9f26bff'
         '16d821e653d750a4c2768e6f5cf8b717')
           
           
           

prepare() {
  cd "$srcdir/mutt-$pkgver"
  patchdir="${srcdir}/mutt-${pkgver}-gentoo-patches-r2"
  # patch to add trash folder support

  # add gentoos patches
  patch -Np1 -i "$patchdir"/mutt-gentoo-1.5.23-r1.patch
  patch -Np1 -i "$patchdir"/ncurses-tinfo.patch
  patch -Np1 -i "$patchdir"/prefix-mailcap.patch
  patch -Np1 -i "$patchdir"/dont-reveal-bbc.patch
  patch -Np1 -i "$patchdir"/01-collapse_flagged.patch
  patch -Np1 -i "$patchdir"/02-compressed.patch
  patch -Np1 -i "$patchdir"/03-progress-bar.patch
  patch -Np1 -i "$patchdir"/04-xterm-set-only-window-title.patch
  patch -Np1 -i "$patchdir"/05-xterm-no-tigetstr-on-tty.patch
  patch -Np1 -i "$patchdir"/06-nntp.patch
  patch -Np1 -i "$patchdir"/07-quote.patch
  patch -Np1 -i "$patchdir"/08-initials.patch
  patch -Np1 -i "$patchdir"/09-smarttime.patch
  patch -Np1 -i "$patchdir"/10-change_folder_next.patch
  patch -Np1 -i "$patchdir"/11-change_subject.patch
  patch -Np1 -i "$patchdir"/12-trash-folder.patch
  patch -Np1 -i "$patchdir"/13-pgp-verbose-mime.patch
  patch -Np1 -i "$patchdir"/14-pgp-display-signature.patch

  # sidebar patches
  patch -Np1 -i "$patchdir"/sidebar.patch
  patch -Np1 -i "$patchdir"/sidebar-utf8.patch
  patch -Np1 -i "$patchdir"/sidebar-dotpathsep.patch

  # fix automake issue
  autoreconf -vfi
}

build() {
  cd "$srcdir/mutt-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc \
              --enable-gpgme --enable-pop \
              --enable-imap --enable-smtp \
              --enable-hcache --with-curses=/usr \
              --with-regex --with-gss=/usr \
              --with-ssl=/usr --with-sasl \
              --with-idn
  make
}

package() {
  cd "$srcdir/mutt-$pkgver"
  make DESTDIR="$pkgdir" install

  # remove unneeded or conflicting files
  rm "$pkgdir"/etc/mime.types{,.dist}
  rm "$pkgdir"/usr/bin/{flea,muttbug}
  rm "$pkgdir"/usr/share/man/man1/{flea,muttbug}.1

  # install Muttrc.gpg file
  install -D -m 644 contrib/gpg.rc "$pkgdir"/etc/Muttrc.gpg.dist
}
