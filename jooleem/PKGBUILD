# Contributor: RedMonkey <rm2aur@gmx.net>
pkgname=jooleem
pkgver=0.1.3
pkgrel=2
pkgdesc="A simple yet extremely addictive puzzle game"
arch=('i686')
url="http://jooleem.sourceforge.net/"
license=('GPL')
depends=(sdl_mixer gcc-libs sdl_ttf sdl_image)
source=(http://downloads.sourceforge.net/sourceforge/jooleem/$pkgname-$pkgver.tar.gz jooleem.desktop jooleem.png)
md5sums=('c9f25c7b479c5ad40a8b433035784b7c' '378c4c0befc515beccca3c9c94c61105' '3fb6a96672727a0374866d7a32595ff3')

build() {
  cd "$startdir/src/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$startdir/pkg" install
  install -D -m644 $startdir/src/jooleem.png $startdir/pkg/usr/share/jooleem-0.1.3/jooleem.png
  install -D -m644 $startdir/src/jooleem.desktop $startdir/pkg/usr/share/applications/jooleem.desktop
}
