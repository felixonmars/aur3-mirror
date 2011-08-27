##Contributor: asp314@gmail.com
#Jaxodraw Package recompiled from Subversion, including the axodraw4j.sty file
pkgname=jaxodraw-svn
pkgrealname=${pkgname%%"-svn"}
pkgver=2.1
pkgrel=SNAPSHOT

pkgdesc="JaxoDraw is a Java program for drawing Feynman diagrams."
arch=(i686 x86_64)
url="http://jaxodraw.sourceforge.net"
license=('GPL')
depends=(apache-ant)
conflicts=(jaxodraw)
provides=(jaxodraw)
source=(jaxodraw.install)
install=(jaxodraw.install)
md5sums=('90f9de9b70d817b10bc1ca6dcedc5711')

build() {
   svn checkout http://jaxodraw.svn.sourceforge.net/svnroot/jaxodraw/trunk/ jaxodraw
   cd jaxodraw/jaxodraw
   /usr/share/java/apache-ant/bin/ant || return 1
   /usr/share/java/apache-ant/bin/ant javadoc

   install -D -m 644 build/$pkgrealname-$pkgver-$pkgrel.jar $pkgdir/opt/Science/JaxoDraw/$pkgrealname.jar

   DOCDIR=/usr/share/doc
   if [ ! -d $pkgdir$DOCDIR ]
   then
           mkdir -p $pkgdir$DOCDIR
   fi

   mv build/javadoc  $pkgdir$DOCDIR/jaxodraw

   BINDIR=/usr/local/bin
   if [ ! -d $pkgdir$BINDIR ]
   then
           mkdir -p $pkgdir$BINDIR
   fi

   install -D -m 755 $startdir/jaxodraw $pkgdir$BINDIR/
   install -D -m 644 $srcdir/jaxodraw/axodraw4j/axodraw4j.sty $pkgdir/usr/share/texmf/tex/latex/axodraw4j/axodraw4j.sty
}

    
