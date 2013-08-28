# Maintainer: Maurizio D'Addona <mauritiusdadd@gmail.com>
pkgname=libsnl
pkgver=svn
pkgrel=1
pkgdesc="libSNL is a library of routines used for the manipulation of NURBS curves and surfaces."
arch=('i686' 'x86_64')
url="http://libsnl.sourceforge.net/"
license=('GPL2')
provides=('libsnl')
conflicts=('libsnl') 
depends=()
makedepends=('svn')
 
build() {
     msg "Downloading..."
     svn checkout svn://svn.code.sf.net/p/libsnl/code/trunk libsnl
     msg2 "Done downloading."
     
     msg "Building..."
     ls
     cd  $srcdir/libsnl/src
     make
     msg2 "Build complete."
}

package()
{
    msg "Copying files..."
    mkdir -p $pkgdir/usr/lib
    install -Dm644 $srcdir/libsnl/src/libSNL.so.0.2 $pkgdir/usr/lib
    ln -s libSNL.so.0.2 $pkgdir/usr/lib/libSNL.so
    install -d $pkgdir/usr/include/libSNL    
    cp $srcdir/libsnl/src/*.h $pkgdir/usr/include/libSNL
    msg2 "Done copying files."
}
