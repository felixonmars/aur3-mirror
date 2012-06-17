# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Maël Lavault <moimael@neuf.fr>

_pkgname=abiword
pkgname=$_pkgname-devel
pkgver=2.9.3
pkgrel=1
pkgdesc="A fully-featured word processor (development release)"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.abisource.com"
depends=('fribidi' 'wv' 'goffice-devel' 'librsvg' 'redland' 'evolution-data-server' 'desktop-file-utils')
makedepends=('boost' 'libwpg' 'libwps' 'telepathy-glib' 'loudmouth' 'asio' 'psiconv' 'gtkmathview' 'libwmf' 'link-grammar' 'aiksaurus' 'libots')
optdepends=('libwpg: wordperfect, wpg plugin'
            'libwps: wordperfect plugin'
            'telepathy-glib: collab plugin'
            'loudmouth: collab plugin'
            'asio: collab plugin'
            'psiconv: psiconv plugin'
            'gtkmathview: mathview plugin'
            'libwmf: wmf plugin'
            'link-grammar: grammar plugin'
            'aiksaurus: aiksaurus plugin'
            'libots: ots plugin')
provides=("$_pkgname=$pkgver" "abiword-plugins=$pkgver")
conflicts=("$_pkgname" "abiword-plugins")
install=$_pkgname.install
options=('!libtool')
source=("http://www.abisource.com/downloads/$_pkgname/$pkgver/source/$_pkgname-$pkgver.tar.gz"
        TelepathyBuddy.h)
sha1sums=('52bfe24fff67f7a0e4b8cf18a8c579ac46663bfd'
          '9bff2f533678706142f1815482b98ca5cb2b06b3')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  sed -i 's/libgoffice-0.10 >= 0.10.0/libgoffice-0.10 >= 0.9.1/
          s/goffice_req >= 0.10.0/goffice_req >= 0.9.1/' configure
  cp -rf "$srcdir/TelepathyBuddy.h" plugins/collab/backends/telepathy/unix/TelepathyBuddy.h

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-maintainer-mode --disable-static \
              --enable-plugins --enable-clipart --enable-templates
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
