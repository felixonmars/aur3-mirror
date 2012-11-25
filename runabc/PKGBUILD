# Contributor: Luis Pablo Gasparotto <lpgasparotto(at)gmail(dot)com>

pkgname=runabc
_pkgname=runabc
pkgver=1.750
pkgrel=1
pkgdesc="Runabc is a frontend for a lot of abc music notation tools"
url="http://ifdo.pugmarks.com/~seymour/runabc/runabc.html"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('tcl' 'tk')
optdepends=('abcm2ps' 'abctab2ps' 'abcmidi' 'timidity++')
source=(http://ifdo.pugmarks.com/~seymour/runabc/runabc.zip)
md5sums=('715d9ac8d01c123ae1555a52a43f04a9')
build() {
  cd $startdir/src/runabc
  install -m 755 -D runabc.tcl $startdir/pkg/usr/bin/runabc.tcl
  install -m 755 -D abcindex.tcl $startdir/pkg/usr/bin/abcindex.tcl
  install -m 755 -d $startdir/pkg/usr/share/runabc/{abc_examples,layout_files}
  install -m 644 -D abc_examples/* $startdir/pkg/usr/share/runabc/abc_examples
  install -m 644 -D layout_files/* $startdir/pkg/usr/share/runabc/layout_files
  install -m 644 -D runabc.doc $startdir/pkg/usr/share/runabc/runabc.doc
  install -m 644 -D gpl.txt $startdir/pkg/usr/share/runabc/gpl.txt
  install -m 644 -D runabc.ico $startdir/pkg/usr/share/runabc/runabc.ico
  install -m 644 -D runabc_map.txt $startdir/pkg/usr/share/runabc/runabc_map.txt
  install -m 644 -D runabc.nsi $startdir/pkg/usr/share/runabc/runabc.nsi
  install -m 644 -D samples.abc $startdir/pkg/usr/share/runabc/samples.abc
  install -m 644 -D $startdir/runabc.png $startdir/pkg/usr/share/pixmaps/runabc.png
  install -m 644 -D $startdir/runabc.desktop $startdir/pkg/usr/share/applications/runabc.desktop
}
