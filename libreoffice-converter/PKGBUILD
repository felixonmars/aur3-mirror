
# Maintainer: Alpar Torok <torokalpar@gmail.com>
pkgname=libreoffice-converter
pkgver=3.3.2
pkgrel=1
epoch=
pkgdesc="Cli tool to convert documents."
arch=( "any" )
url="http://www.artofsolving.com/files/DocumentConverter.py"
license=('LGPL')
groups=("office")
depends=( "python2" "libreoffice" "libreoffice-sdk" )
makedepends=()
checkdepends=()
optdepends=()
provides=( "loconvert" )
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
  # From the URL 
  "DocumentConverter.py"
  # adapted from the suse package for the newer DocumentConverter 
  "DocumentConverter.py-more-types.diff"
  # From the opensuse package 
  "loconvert"
  # Needed to make it work on arch
  "loconvert.arch.patch"
)
noextract=()
md5sums=('2bb97a522e0372f1919191cb4cdc45e6'
         '3d6da38a242d7611f41c8fe531582388'
         'e190f63e7e2bc0886c386d29692ce870'
         '2649c81d6d093620fc94f9e645958163')

build() {
  cd "$srcdir"
  patch DocumentConverter.py < DocumentConverter.py-more-types.diff
  patch loconvert            < loconvert.arch.patch
}

package() {
  cd "$pkgdir"
  mkdir -p usr/share/libreoffice/program/
  mkdir -p usr/bin
  cp $srcdir/DocumentConverter.py  usr/share/libreoffice/program/
  cp $srcdir/loconvert usr/bin/
  chmod +x usr/bin/loconvert
}

# vim:set ts=2 sw=2 et:
