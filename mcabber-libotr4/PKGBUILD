# Maintainer: Norman Köhring <n at koer dot in>
pkgname=mcabber-libotr4
_pkgname=mcabber
pkgver=0.10.2
pkgrel=1
pkgdesc="A small Jabber console client, includes features: SSL, PGP, MUC, UTF8"
url="http://mcabber.com"
arch=('i686' 'x86_64')
license=('GPL')
depends=(ncurses  glib2  loudmouth  gpgme  libotr  aspell libidn)
options=()
provides=('mcabber=0.10.2')
conflicts=('mcabber' 'mcabber-hg')
source=(http://mcabber.com/files/$_pkgname-$pkgver.tar.bz2
        use-otr-v4.diff)
sha1sums=('7bff70dcf09e8a8a4cc7219e03b48bad382a6bda'
          '412be1082a0a9c573890c24fa6e51f15823fd497')

build() {
  cd $srcdir/$_pkgname-$pkgver
  msg "Applying libotr4 patch…"
  patch -Np2 -i ../use-otr-v4.diff || return 1

  autoconf
  ./configure --prefix=/usr --enable-otr --enable-aspell --enable-modules \
              --with-libidn
  make || return 1
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

