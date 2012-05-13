# Maintainer : giacomogiorgianni@gmail.com
# Contributor: 


pkgname=sdldevil
pkgver=0.5
pkgrel=1
pkgdesc="SDLDevil is a Leveleditor for the classic computer games Descent and Descent 2 by Parallax Software"
arch=('i686' 'x86_64')
url="http://sdldevil.sourceforge.net/"
license=('GPLv2')
depends=('sdl')
source=("http://sourceforge.net/projects/sdldevil/files/$pkgname-$pkgver-src.tar.gz")
md5sums=('b7c13c0cbc3154f28746a291eb16502f')

build() {
  cd "$srcdir/$pkgname-$pkgver/src"
  make DESTDIR="$pkgdir/"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # bin
  install -Dm755 "$srcdir/$pkgname-$pkgver/src/$pkgname"\
    "$pkgdir/usr/bin/$pkgname"

  # desktop file
  install -Dm644 ${startdir}/sdldevil.desktop \
    "$pkgdir/usr/share/applications/sdldevil.desktop"

  # icon
  install -Dm644 ${startdir}/sdldevil_icon-0.png \
    "$pkgdir/usr/share/pixmaps/sdldevil_icon-0.png"
}