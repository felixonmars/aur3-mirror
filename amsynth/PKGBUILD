# Contributor: Alessio Biancalana <dottorblaster@gmail.com>

pkgname=amsynth
pkgver=1.3.1
pkgrel=1
pkgdesc="Analogue Modeling SYNTHesizer"
arch=('i686' 'x86_64')
url="http://code.google.com/p/amsynth/"
license=('GPL')
depends=('gtkmm' 'jack')
source=(http://amsynth.googlecode.com/files/amSynth-${pkgver}.tar.gz)
md5sums=('f21cb484283dc642138ab9d7f6099e89')

build() {
  cd ${srcdir}/amSynth-${pkgver}

  sed -i -e 's|/amSynth|/amsynth|' src/main.cc

  ./configure --prefix=/usr
  make

  install -Dm755 src/amSynth ${pkgdir}/usr/bin/amSynth
  mkdir -p ${pkgdir}/usr/share/${pkgname}
  install -m644 skel/{Controllersrc,presets} ${pkgdir}/usr/share/${pkgname}/
}
