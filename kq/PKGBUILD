# Contributor: Hasufell <jd.o*gmx.de>

pkgname=kq
pkgver=20091214
pkgrel=2
pkgdesc="A console-style role playing game"
arch=('i686' 'x86_64')
url="http://kqlives.sourceforge.net/"
license=('GPL2')
depends=('allegro>=4' 'libglade')
makedepends=('pkgconfig>=0.9' 'lua>=5' 'dumb>=0.9.2')
source=('http://downloads.sourceforge.net/kqlives/kq-0.99.tar.gz'
'kqlives.desktop'
'kqlogo.png')
md5sums=('0bf9614e3be3d02795fe476227ab7330'
         'f1167281d8cf8b3d2728d3aea51f3c40'
         '3ac37dd42553a76a0886288f96c51412')

build() {
cd $startdir/src/kq-0.99

./configure --prefix=/usr --disable-debug
make || return 1
make DESTDIR=$pkgdir install
    
# Install Desktop File
  install -D -m644 $srcdir/kqlives.desktop \
  $pkgdir/usr/share/applications/kqlives.desktop

# Install Icon File
  install -D -m644 $srcdir/kqlogo.png \
  $pkgdir/usr/share/pixmaps/kqlogo.png
}
