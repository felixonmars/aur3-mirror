pkgname=gnaural-bbgen
pkgver=1.0.20101006
pkgrel=1
pkgdesc="Binaural-Beat audio generator "
url="http://gnaural.sourceforge.net/"
license=('GPL')
arch=('i686')
depends=('gtk2' 'glib2' 'libglade' 'libsndfile' 'portaudio')
source=(http://downloads.sourceforge.net/gnaural/gnaural-$pkgver.tar.gz)
md5sums=('d2c6fc1c38d53bea7760c624af5c0882')

build() {
  pushd ${srcdir}/gnaural-$pkgver || return 1
  	./configure --prefix=/usr || return 1
  	make || return 1
  
  	install -d ${pkgdir}/usr/bin || return 1
  	install -D -m755 src/gnaural ${pkgdir}/usr/bin/gnaural || return 1
  
  	install -d ${pkgdir}/usr/share/gnaural/pixmaps || return 1
  	install -D -m644 src/gnaural.glade ${pkgdir}/usr/share/gnaural/gnaural.glade || return 1
  	install -D -m644 pixmaps/* ${pkgdir}/usr/share/gnaural/pixmaps/ || return 1
  	
  	install -d ${pkgdir}/usr/share/applications || return 1
  	install -D -m755 gnaural.desktop ${pkgdir}/usr/share/applications/gnaural.desktop || return 1
  popd || return 1
}



