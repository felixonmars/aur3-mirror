# Contributor: Thomas Mudrunka <harvie@@email..cz>
# Maintainer:  Thomas Mudrunka <harvie@@email..cz>
# You can also contact me on http://blog.harvie.cz/

pkgname=gedasymbols-cvs
pkgver=20141121
pkgrel=1
pkgdesc="GEDA+PCB symbols and footprints of parts from gedasymbols.org"
arch=(any)
url="http://www.gedasymbols.org/cvs.html"
license=('GPL')
groups=()
depends=()
makedepends=('cvs')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_cvsroot=:pserver:anonymous:anonymous@cvs.gedasymbols.org:/cvs/gedasymbols
_cvsmod=.

build() {
  cd "$srcdir"
  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."

  if [[ -d "$_cvsmod/CVS" ]]; then
    cd "$_cvsmod"
    cvs -z3 update -d
  else
    cvs -z3 -d "$_cvsroot" co -D "$pkgver" -f "$_cvsmod"
    cd "$_cvsmod"
  fi

  msg "CVS checkout done or server timeout"
}

package() {
  mkdir -p "$pkgdir/usr/share/pcb/newlib"
  mkdir -p "$pkgdir/usr/share/gEDA/sym"
  for i in "$srcdir"/www/footprints/newlib/*; do
	cp -r "$i" "$pkgdir/usr/share/pcb/newlib/";
	done;
  for i in "$srcdir"/www/user/*/footprints/*; do
	cp -r "$i" "$pkgdir/usr/share/pcb/newlib/";
	done;

  find "$pkgdir" -name 'CVS' | xargs rm -r
}

# vim:set ts=2 sw=2 et:
