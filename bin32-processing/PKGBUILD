# Contributor: thelucster

pkgname=bin32-processing
pkgver=1.0.3
pkgrel=1
pkgdesc="An open source programming language and environment for people who want to program images, animation, and interactions. "
arch=(x86_64)
url="http://www.processing.org/"
license=('GPL' 'LGPL')
depends=('lib32-jdk')
makedepends=('gif2png')
source=(http://www.processing.org/download/processing-$pkgver.tgz processing processing.desktop)
md5sums=('59e12d676e31044e47fa1f61867bd07a')

build() {
	# create directories
	cd ${startdir}/src/processing-$pkgver
	mkdir -p ${startdir}/pkg/opt/bin32-processing
  	mkdir -p ${startdir}/pkg/usr/bin
  	#mkdir -p ${startdir}/pkg/usr/share/pixmaps
  	mkdir -p ${startdir}/pkg/usr/share/applications
  
  	# install main stuff
	cp -R {examples,lib,libraries,reference,tools} ${startdir}/pkg/opt/bin32-processing
	
	# install launcher
	cp ${startdir}/processing ${startdir}/pkg/usr/bin/processing
  	chmod +x ${startdir}/pkg/usr/bin/processing
  	
  	# icon
	#gif2png lib/icon.gif
	#cp lib/icon.png ${startdir}/pkg/usr/share/pixmaps/processing.png
	
	# desktop entry
	cp ${startdir}/processing.desktop ${startdir}/pkg/usr/share/applications
}
