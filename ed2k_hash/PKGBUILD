# Contributor: Eric Le Bras <eric.lebras@gmail.com>

pkgname=ed2k_hash
pkgver=0.4.0
pkgrel=1
pkgdesc="Edonkey 2000 file hash calculator"
url="http://ed2k-tools.sourceforge.net/ed2k_hash.shtml"
license=('GPL')
arch=('i686' 'x86_64')
depends=('fltk')
source=(http://downloads.sourceforge.net/sourceforge/ed2k-tools/ed2k_hash-${pkgver}.tar.gz
	ed2k_hash-gcc43.patch
	ed2k_hash-64bit.patch
	ed2k_hash.desktop
	ed2k_hash.png)
md5sums=('545d44d5e00078011f41a18e235f4af8'
         'e6c0145a1a3ed855bc9f6d7fa2148e45'
         'af0f965f6712ae55127b7d22bf8708af'
         'b6068fa1f78d78c0e70eefb82511326b'
         '5a5af41f757248a8375916d09f27285c')

build() {
  cd $srcdir/$pkgname-$pkgver
  patch -Np1 -i ${startdir}/src/ed2k_hash-gcc43.patch || return 1
  [ "$CARCH" == "x86_64" ] && (patch -Np1 -i ${startdir}/src/ed2k_hash-64bit.patch || return 1)
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$pkgdir install
  install -D -m644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -D -m644 $srcdir/$pkgname.png $pkgdir/usr/share/icons/hicolor/24x24/apps/$pkgname.png
}
