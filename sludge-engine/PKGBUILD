# Contributor: Eric Forgeot < http://ifiction.free.fr >
pkgname=sludge-engine
pkgver=2.0b
pkgrel=3
pkgdesc="Scripting Language for Unhindered Development of a Gaming Environment is a system by which anyone can make an adventure game. Engine only."
arch=(i686 x86_64)
url="http://opensludge.sourceforge.net/"
license=('gpl')
depends=('glibc' 'sdl' 'glee' 'libpng' 'freeglut' 'libvorbis' 'flac' 'dumb-autotools')
makedepends=('alure-git')
source=(http://downloads.sourceforge.net/sourceforge/opensludge/sludge-engine-2.0b-20100706.tar.gz)
md5sums=('14d52c4124fb5de81df9d3e05b61c655')



build() {
  cd $srcdir/${pkgname}-${pkgver}
  cp /usr/include/GL/GLee.h $srcdir/${pkgname}-${pkgver}/source/Engine/
    ./configure --prefix=/usr
	make || return 1
	make DESTDIR=$startdir/pkg install || return 1
}


package() {
	
	mkdir -p $pkgdir/usr/share/${pkgname}
	mkdir -p $pkgdir/usr/bin/
	#cp $srcdir/${pkgname}-${pkgver}/source/Engine/${pkgname} $pkgdir/usr/bin/
	cp $srcdir/${pkgname}-${pkgver}/README $pkgdir/usr/share/${pkgname}/
	cp $srcdir/${pkgname}-${pkgver}/AUTHORS $pkgdir/usr/share/${pkgname}/
	

}

