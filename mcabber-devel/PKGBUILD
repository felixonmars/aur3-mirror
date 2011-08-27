pkgname=mcabber-devel
_pkgname=mcabber
pkgver=0.9.10
pkgrel=2
pkgdesc="A small Jabber console client, includes features: SSL, PGP, MUC, UTF8"
arch=('i686' 'x86_64')
url="http://www.lilotux.net/~mikael/mcabber/"
license=('GPL')
depends=('ncurses' 'glib2' 'openssl' 'gpgme' 'libotr' 'aspell')
makedepends=('pkgconfig')
source=(http://lilotux.net/~mikael/mcabber/hg/index.cgi/archive/tip.tar.gz mcabber.patch)
build() {
  cd $startdir/src/$_pkgname-*/$_pkgname
  cp macros/missing/gnutls-extra.m4 macros/
  patch -p1 -i ../../mcabber.patch
  autoreconf --force --install || return 1
  automake || return 1
  ./configure --prefix=/usr --enable-hgcset --with-ssl \
      --with-openssl=/usr/lib --mandir=/usr/share/man \
      --enable-aspell --enable-otr
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
md5sums=('cae6db501ef5e99516ad17e41d90e106'
         '03b357f2169a9032e04d848f72b790de')
