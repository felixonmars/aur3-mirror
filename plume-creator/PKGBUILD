# Maintainer: Chris T.R. <chris.trr@gmail.com>
pkgname=plume-creator
pkgver=0.66.1
pkgrel=2
epoch=
pkgdesc=""With Plume Creator, organize your writing projects ! Scenes, notes, characters,... Rich Text editing, full screen editing and multiple projects supported. Languages : english, french, italian, german, portuguese." — http://www.plume-creator.eu"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/plume-creator/"
license=('GPL')
groups=()
depends=('qt4')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
_qmakefile="plume-creator.pro"
source=("http://sourceforge.net/projects/plume-creator/files/0.6/plume-creator-$pkgver-src.tar.gz"
		"plume-creator.png"
        "plume-creator.desktop")
noextract=()
md5sums=('a275d3cf6eba8548b91c772f3ba8c8c7'
         '1f316f8d108d883fb12ead7cf33d9234'
         '08efcebd3772b1574e13ad9e8ce17086') #generate with 'makepkg -g'


build() {
  cd "$srcdir"
  qmake-qt4 ${_qmakefile}
  #make
}

check() {
  cd "$srcdir"
  make -k check
}

package() {
  mkdir "$pkgdir/usr"
  mkdir "$pkgdir/usr/bin"
  cp "$srcdir/plume-creator" "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/plume-creator.desktop" "$pkgdir/usr/share/applications/plume-creator.desktop"
  install -Dm644 "$srcdir/plume-creator.png" "$pkgdir/usr/share/pixmaps/plume-creator.png"
}

# vim:set ts=2 sw=2 et:
