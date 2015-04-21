# Contributor: Conrad Nelson <yaro@marupa.net>
pkgname=kildclient
pkgver=3.0.1
pkgrel=2
pkgdesc="A powerful MUD client written for GTK+ and support for Perl."
arch=('i686' 'x86_64')
url="http://kildclient.sourceforge.net"
license=('GPL')
depends=('gtk3' 'libglade' 'gtkspell3' 'perl-locale-gettext' 'perl-json')
source=(http://prdownloads.sourceforge.net/kildclient/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('017645d0c6a6cc13bec206f5778a1598')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --mandir=/usr/man --with-gtkspell \
  --with-libgnutls --with-docs
  make || return 1
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
