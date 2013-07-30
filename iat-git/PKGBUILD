# Maintainer: lolilolicon <lolilolicon_at_gmail_dot_com>

pkgname=iat-git
_realname=iat
pkgver=20100812
pkgrel=1
pkgdesc="Iso9660 Analyzer Tool detects many types of CD-ROM/DVD images, and converts them to UDF/ISO."
arch=('i686' 'x86_64')
url="http://iat.berlios.de"
license=('GPL')
makedepends=('git')
provides=('iat')
conflicts=('iat')
source=("$_realname::git://git.berlios.de/iat" autogen.sh) # backup mirror: git://github.com/lolilolicon/iat.git
md5sums=('SKIP'
         '055b668edaf253fa7c3e998a6006018f')

pkgver() {
  cd "$srcdir/$_realname"
  git log -1 --format=%cd --date=short | tr -d -
}

build() {
  cd "$srcdir/$_realname"
  ../autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_realname"
  make DESTDIR="$pkgdir" install
}
