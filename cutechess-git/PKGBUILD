# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=cutechess-git
pkgver=1432.fa9b249
pkgrel=1
pkgdesc="GUI and cli application for automating chess engine tournaments.(xboard & UCI)"
url="http://ajonsson.kapsi.fi/cutechess.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('qt4')
makedepends=('git')
source=('cutechess.desktop' 'git+git://github.com/cutechess/cutechess.git')
md5sums=('484ede49e1f307994972476b3ede3970' 'SKIP')

prepare() {
   cd $srcdir/cutechess 
   qmake-qt4
}

build() {
   cd $srcdir/cutechess
   make
}

package() {
   cd $srcdir/cutechess/projects
   
   # Install binaries and libraries
   install -Dm755 cli/cutechess-cli $pkgdir/usr/bin/cutechess-cli
   install -Dm755 gui/cutechess $pkgdir/usr/bin/cutechess
   install -Dm644 lib/libcutechess.so.1.0.0 $pkgdir/usr/lib/libcutechess.so.1.0.0

   # Symlinks to libcutechess library
   ln -s "/usr/lib/libcutechess.so.1.0.0" "$pkgdir/usr/lib/libcutechess.so"
   ln -s "/usr/lib/libcutechess.so.1.0.0" "$pkgdir/usr/lib/libcutechess.so.1"
   ln -s "/usr/lib/libcutechess.so.1.0.0" "$pkgdir/usr/lib/libcutechess.so.1.0"

   # Desktop icon
   install -Dm644 gui/res/icons/cutechess_128x128.png $pkgdir/usr/share/pixmaps/cutechess.png
   install -Dm644 $srcdir/cutechess.desktop $pkgdir/usr/share/applications/cutechess.desktop

   # Man pages
   install -Dm644 ../docs/cutechess-cli.6 $pkgdir/usr/share/man/man6/cutechess-cli.6  
   install -Dm644 ../docs/engines.json.5 $pkgdir/usr/share/man/man5/engines.json.5
}

pkgver() {
  cd $srcdir/cutechess
  echo $(git rev-list --count master).$(git rev-parse --short master)
}