# Contributor: zlowly <zlowly@gmail.com>
pkgname=gmbox
pkgver=0.4b
_pkgver=0.4beta
_pkgname=$pkgname-gtk
pkgrel=1
pkgdesc="Google music box"
arch=("i686" "x86_64")
url="http://code.google.com/p/gmbox/"
license=('GPL3')
depends=('python2>=2.6' 'pygtk' 'python-notify2')
source=(http://gmbox.googlecode.com/files/${_pkgname}-${_pkgver}.tar.gz
flashplayer_key.patch)
md5sums=('85eeb523abf388c39cc870f15e4f2baf'
         'cbcc5967c81d0703a725a3dcd172c328')
build() {
  cd $srcdir
  patch -p0 -i flashplayer_key.patch
  sed -i "s/Exec=.*/Exec=python2 \/usr\/share\/$_pkgname\/$_pkgname.py/" $_pkgname/debian/gmbox.desktop
}
package() {
  install -d $pkgdir/usr/share/$_pkgname/$pkgname
  install -d $pkgdir/usr/share/$_pkgname/libgmbox
  install -d $pkgdir/usr/share/$_pkgname/data/{glade,pixbufs}
  install -m 0755 $srcdir/$_pkgname/$_pkgname.py $pkgdir/usr/share/$_pkgname
  install -m 0644 $srcdir/$_pkgname/libgmbox/*  $pkgdir/usr/share/$_pkgname/libgmbox
  install -m 0644 $srcdir/$_pkgname/data/glade/*  $pkgdir/usr/share/$_pkgname/data/glade
  install -m 0644 $srcdir/$_pkgname/data/pixbufs/*  $pkgdir/usr/share/$_pkgname/data/pixbufs
  install -m 0644 $srcdir/$_pkgname/$pkgname/* $pkgdir/usr/share/$_pkgname/$pkgname
  install -Dm 0644 $srcdir/$_pkgname/debian/gmbox.desktop $pkgdir/usr/share/applications/gmbox.desktop
  install -Dm 0644 $srcdir/$_pkgname/data/pixbufs/gmbox.png $pkgdir/usr/share/pixmaps/gmbox.png
}

# vim:set ts=2 sw=2 et:
