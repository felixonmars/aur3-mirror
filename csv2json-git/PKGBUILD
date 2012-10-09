# Maintainer: webcarrot <admin at webcarrot dot pl>

pkgname=csv2json-git
pkgver=20121009
pkgrel=1
pkgdesc="Writen in C, CSV file to JSON file/string converter with utf8 support."
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/webcarrot/csv2json"
makedepends=('git')

_gitroot="git://github.com/webcarrot/csv2json.git"
_gitname="csv2json"

build() {
 cd "$srcdir"
 msg "Connecting to GIT server..."
 if [ -d $_gitname ] ; then
   cd $_gitname && git pull origin
   msg "The local files are updated."
 else
   git clone --depth=1 $_gitroot $_gitname
 fi
 msg "GIT checkout done or server timeout"
 rm -rf "$srcdir/$_gitname-build"
 mkdir -p "$srcdir/$_gitname-build"
 cd "$srcdir/$_gitname" && ls -A | grep -v .git | xargs -d '\n' cp -r -t "$srcdir/$_gitname-build"
 cd "$srcdir/$_gitname-build"
 make CFLAGS="${CFLAGS}" all
}

package() {
 cd "$srcdir/$_gitname-build"
 make DESTDIR="${pkgdir}" BINDIR="/usr/bin" install
}
