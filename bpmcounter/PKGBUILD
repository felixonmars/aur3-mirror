# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
pkgname=bpmcounter
pkgver=0.1.0
pkgrel=2
pkgdesc="A tool which detects BPM in audio files"
arch=(i686)
url="http://djplay.sourceforge.net/"
license=('GPL')
depends=('libmad' 'fftw' 'qt' 'id3lib')
source=(http://downloads.sourceforge.net/sourceforge/djplay/${pkgname}-${pkgver}.tar.gz)
md5sums=('0b72db4b507a2d710d6dcd94981fe2ab')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
