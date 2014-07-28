# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: AddiKT1ve <the.addikt1ve@gmail.com>
# Developer: Link/DD <linkdd@ydb.me>

pkgname=cream-browser
pkgver=38125cd
pkgrel=1
pkgdesc="A vim-like lightweight web browser based on WebKit and the GTK+ library"
arch=('i686' 'x86_64')
url="http://cream-browser.net"
license=('GPL')
depends=('webkitgtk' 'confuse' 'gtk3' 'libsoup' 'lua')
makedepends=('git' 'cmake')
source=("git://github.com/LinkDD/cream-browser.git#branch=unstable")
md5sums=('SKIP')


pkgver() {
  cd $pkgname
  git describe --always | sed -e 's|-|.|g'
}

build() {
  cd $pkgname

  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname

  make DESTDIR=$pkgdir install
}
