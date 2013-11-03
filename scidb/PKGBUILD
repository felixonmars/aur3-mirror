# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=scidb
pkgver=r960
pkgrel=1
pkgdesc="Chess Information Data Base"
arch=('x86_64' 'i686')
url="http://scidb.sourceforge.net/"
license=('GPL2')
depends=('gdbm' 'libsm' 'libxcursor' 'minizip' 'tk' 'zziplib')
options=('!buildflags' '!makeflags')
source=(http://downloads.sourceforge.net/project/scidb/scidb-beta-code-$pkgver.tar.gz
        $pkgname.desktop)
md5sums=('e6ebc0ea7250f33d4bf8267b94d4700e'
         '1071c031e98bec241be3a5601bb4e634')

prepare() {
   cd $srcdir/scidb-beta-code-$pkgver
   ./configure --prefix="/usr" --exec-prefix="/usr" --mandir=/usr/share/man --enginesdir=/usr/bin
}

build() {
   cd $srcdir/scidb-beta-code-$pkgver
   make
}

package () {
   cd $srcdir/scidb-beta-code-$pkgver
   
   # Create directories
   install -dm755 $pkgdir/usr/share/scidb-beta/engines/sjeng-scidb
   install -dm755 $pkgdir/usr/share/fonts/truetype/Scidb
   install -dm755 $pkgdir/usr/share/scidb-beta/{cursor,help,hyphen,photos}

   # Desktop icon
   install -Dm644 freedesktop.org/scidb-128.png $pkgdir/usr/share/pixmaps/scidb.png
   install -Dm644 ../scidb.desktop $pkgdir/usr/share/applications/scidb.desktop

   # Update photo files
   install -Dm755 tcl/update-scidb-photo-files $pkgdir/usr/bin/update-scidb-photo-files
   
   # Executables
   cd src
   cp cbh2si4 cdb2sci $srcdir/scidb-beta-code-$pkgver/tcl/scidb-beta tclscidb-beta tkscidb-beta $pkgdir/usr/bin
 
   # Data directory
   cp -r data/ $pkgdir/usr/share/scidb-beta
 
   # Hyphen
   cp -r util/libhyphenate/{dict,pattern} $pkgdir/usr/share/scidb-beta/hyphen
   
   # Opening books
   cd ..
   cp engines/Sjeng/books/* $pkgdir/usr/share/scidb-beta/engines/sjeng-scidb
   cp -rf tcl/engines/* $pkgdir/usr/share/scidb-beta/engines

   # Man pages
   install -Dm644 man/cbh2si4.1.gz $pkgdir/usr/share/man/man1/cbh2si4.1.gz
   install -Dm644 man/cdb2sci.1.gz $pkgdir/usr/share/man/man1/cdb2sci.1.gz
   install -Dm644 man/scidb-beta.1.gz $pkgdir/usr/share/man/man1/scidb-beta.1.gz
   
   # Chess engines
   cd engines
   cp stockfish/stockfish-scidb Sjeng/sjeng-scidb $pkgdir/usr/bin
   
   # Data
   cd $srcdir/scidb-beta-code-$pkgver
   cp -r freedesktop.org/ $pkgdir/usr/share/scidb-beta
   cd tcl
   cp -r flags/ images/ lang/ pdf/ pieces/ scripts/ textures/ themes/ $pkgdir/usr/share/scidb-beta
   
   # Cursor directory
   cp cursor/*.x{cur,bm} $pkgdir/usr/share/scidb-beta/cursor
   
   # Help directory
   cp -r help/{de,en,es,hu,images,it,styles} $pkgdir/usr/share/scidb-beta/help   
   
   # Fonts
   cp fonts/*.ttf $pkgdir/usr/share/fonts/truetype/Scidb
}