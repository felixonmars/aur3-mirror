# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=gqclient
_pkgname=gq
pkgver=1.2.3
pkgrel=1
pkgdesc="GQ is an LDAP client based on GTK+/GTK2 "
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/gqclient/"
license=('GPL')
depends=("libglade" "libgnome-keyring")
makedepends=()
options=(!emptydirs)
install='gqclient.install'
source=("http://downloads.sourceforge.net/project/${pkgname}/GQ%20LDAP%20Client/${pkgver}/gq-${pkgver}.tar.gz")
md5sums=() #generate with 'makepkg -g'

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  export LDFLAGS='-lcrypto'
  ./configure --prefix=/usr --disable-update-mimedb
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
md5sums=('c4b40f095961da936abfc8f42d57e4fe')
