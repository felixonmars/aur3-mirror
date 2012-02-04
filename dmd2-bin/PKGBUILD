# Maintainer: Mihail Strashun <m.strashun@gmail.com> aka Volfram
pkgname=dmd2-bin
pkgver=2.052
pkgrel=3
pkgdesc="The Digital Mars D compiler (D2 version)"
arch=('i686' 'x86_64')
url="http://www.digitalmars.com/d/2.0/"
source=(http://ftp.digitalmars.com/dmd.$pkgver.zip)
md5sums=('133e80a929eaeddc9fe8964bbfa4cc4f' )
provides=('d-compiler='$pkgver 'dmd2='$pkgver)
license=('custom')
options=('!strip' 'docs')
depends=('gcc-libs')
optdepends=('libphobos2: Standard D language library & runtime')

if [ $CARCH = 'x86_64' ]
then
	archstr="64"
fi

if [ $CARCH = 'i686' ]
then 
	archstr="32"
fi

build() {
   # Copy the license.
   install -Dm644 $srcdir/dmd2/license.txt $pkgdir/usr/share/licenses/dmd/COPYING

   # Copy binaries
   install -Dm755 $srcdir/dmd2/linux/bin/dmd $pkgdir/usr/bin/dmd
   install -Dm755 $srcdir/dmd2/linux/bin/dumpobj $pkgdir/usr/bin/dumpobj
   install -Dm755 $srcdir/dmd2/linux/bin/obj2asm $pkgdir/usr/bin/obj2asm
   install -Dm755 $srcdir/dmd2/linux/bin/rdmd $pkgdir/usr/bin/rdmd
   echo -e "[Environment]\nDFLAGS=-m$archstr -I/usr/include/d -I/usr/include/d/druntime/import -L-L/usr/lib -L-lrt" > $startdir/dmd.conf
   install -Dm644 $startdir/dmd.conf $pkgdir/etc/dmd.conf 

   for x in $srcdir/dmd2/man/man1/*.1; do
       install -Dm644 $x "$pkgdir/usr/share/man/man1/$(basename $x)"
   done

   for x in $srcdir/dmd2/man/man1/*.5; do
       install -Dm644 $x "$pkgdir/usr/share/man/man5/$(basename $x)"
   done

   # Copy documentation
   mkdir -p $pkgdir/usr/share/doc/d/phobos
   docs="$srcdir/dmd2/html/d"
   for x in $(find $docs/*.html $docs/*.gif $docs/*.ico $docs/*.jpg $docs/*.css); do
       install -Dm644 $x "$pkgdir/usr/share/doc/d/$(basename $x)"
   done

   for x in $(find $docs/phobos/*.html $docs/phobos/*.gif $docs/phobos/*.css); do
       install -Dm644 $x "$pkgdir/usr/share/doc/d/phobos/$(basename $x)"
   done
}

