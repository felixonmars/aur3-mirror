# Contributor: Vamp898 <vamp898@web.de>
pkgname=granule
pkgver=1.4.0
pkgrel=7
pkgdesc="granule is a flashcard program that implements Leitner (by the German psychologist Sebastian Leitner in the 1970s) cardfile methodology for learning new words"
arch=( 'i686' 'x86_64' )
url="http://granule.sourceforge.net"
license=('GPL')
depends=( 'gtk' 'libassa' )
source=( http://mesh.dl.sourceforge.net/sourceforge/granule/granule-1.4.0-7.tar.gz )
md5sums=('4e327db531133ffeb650392042341443')


build() {

       cd $srcdir/granule-1.4.0-7
       ./configure --prefix=/usr || return 1
       make || return 1
       make DESTDIR=$pkgdir install || return 1
       
}
