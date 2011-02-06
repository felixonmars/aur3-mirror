# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
#as of 1.8.8rc2
# Contributor: farid abdelnour <farid at archlinux-br.org>

pkgname=ams
pkgver=2.0.1
pkgrel=2
pkgdesc="Alsa Modular Synth is a realtime modular synthesizer and effect processor"
arch=('i686' 'x86_64')
url="http://alsamodular.sourceforge.net/"
license=('GPL')
depends=('qt' 'clalsadrv' 'ladspa' 'fftw' 'jack-audio-connection-kit')
install=(ams.install)
source=(http://sourceforge.net/projects/alsamodular/files/alsamodular/2.0.1/${pkgname}-${pkgver}.tar.gz/download)
md5sums=('a7a3ff0fc038af1cd8cf30a1bb4e740b')
build() {
	#cd ${startdir}/src/ams-2.0.1
	cd $srcdir/${pkgname}-${pkgver}
	./configure --prefix=/usr || return 1 
	make 
      make DESTDIR=$pkgdir/ install || return 1     
	mkdir -p ${startdir}/pkg/usr/share/${pkgname} || return 1 
	cp -a ${startdir}/src/${pkgname}-${pkgver}/{demos,instruments,tutorial} ${startdir}/pkg/usr/share/${pkgname} || return 1       
}
