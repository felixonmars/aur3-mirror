# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: "Whoever the guy was who brought it on AUR"

pkgname=amulet
pkgver=r33.162a254
pkgrel=1
pkgdesc="Audio converter based on ffmpeg."
arch=('i686' 'x86_64')
url="http://gitorious.org/amulet"
license=('GPL')
depends=('ffmpeg' 'qt5-base')
makedepends=('git') #'cmake'
source=("git://gitorious.org/amulet/amulet.git")
md5sums=('SKIP')


pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"

  #mkdir build
  #cd build
  #cmake ..
  qmake $pkgname.pro
  make
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
  mkdir -p $pkgdir/usr/share/$pkgname/extensions/
  install -Dm644 extensions/* $pkgdir/usr/share/$pkgname/extensions/
  install -Dm644 icons/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm644 man.pdf $pkgdir/usr/share/$pkgname/
  #make install
}

# vim:set ts=2 sw=2 et:
