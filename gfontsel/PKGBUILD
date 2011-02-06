# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Contributor: Martin Brandenburg <brandemk@gmail.com>
pkgname=gfontsel
pkgver=1.0.0
pkgrel=1
pkgdesc="This program is a simple wrapper around the GTK+ 2 font selection dialog. It allows you to select a font. The font name is written to the standard output in the GTK+ 2 font naming scheme."
arch=('x86_64')
url="http://www.xs4all.nl/~rsmith/software/#gfontsel"
license=('GPL')
groups=()
depends=('gtk2' 'freetype2')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
#install=
source=(
http://www.xs4all.nl/~rsmith/software/$pkgname-$pkgver.tar.gz
Makefile.patch
)
noextract=()
md5sums=(
'd68c4d377a7dbb01243c6c53f33618e1'
'95eec57e888542d66b942cbb03e5461f') #generate with 'makepkg -g'

build() {
  cd "$startdir/src/$pkgname-$pkgver"

  patch -p0 < $startdir/Makefile.patch

  make || return 1
  make DESTDIR="$startdir/pkg" install
}

# vim:set ts=2 sw=2 et:
