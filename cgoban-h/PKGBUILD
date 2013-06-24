# Maintainer: Peter Neubauer <peterneubauer2 at gmail dot com>
# Contributor: Jonathan Schaeffer <Joschaeffer at gmail dot com>

pkgname=cgoban-h
pkgver=3.5.minus1
pkgrel=1
pkgdesc="KGS client 'hacked' with some enhancements"
url="http://beijinggoclub.com/"
arch=('any')
license=('Freeware')
depends=(desktop-file-utils java-runtime)
install=cgoban-h.install
source=(http://beijinggoclub.com/cgoban-h.jar cgoban-h cgoban-h.desktop cgoban-h-edit.desktop cgoban-h.png)
noextract=(cgoban-h.jar)
md5sums=('e66b3205a535e0ee8708c579ed862944'
         '71383ca26bdebf312c1ed08dc5fc74d4'
         '9c25669f3943e3971a83c3dcbd6481ef'
         '63da4edee3b0638ab77f108a4fc6719e'
         '05251c9ce7d768f74a96f3a616213af2')

package() {
  install -D -m644 $srcdir/cgoban-h.jar $pkgdir/usr/share/java/cgoban3/cgoban-h.jar
  install -D -m644 $srcdir/cgoban-h.desktop $pkgdir/usr/share/applications/cgoban-h.desktop
  install -D -m644 $srcdir/cgoban-h-edit.desktop $pkgdir/usr/share/applications/cgoban-h-edit.desktop
  install -D -m644 $srcdir/cgoban-h.png $pkgdir/usr/share/pixmaps/cgoban-h.png
  install -D -m755 $srcdir/cgoban-h $pkgdir/usr/bin/cgoban-h
}

