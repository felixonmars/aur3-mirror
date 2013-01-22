# Contributor: Alessio Biancalana <dottorblaster@gmail.com>

pkgname=amsynth
pkgver=1.3.2
pkgrel=1
pkgdesc="Analogue Modeling SYNTHesizer"
arch=('i686' 'x86_64')
url="http://code.google.com/p/amsynth/"
license=('GPL')
depends=('gtkmm' 'jack')
source=(http://amsynth.googlecode.com/files/amSynth-${pkgver}.tar.gz)
md5sums=('991329e433bb8c496f9ca5158faf0bca')

build() {
  cd ${srcdir}/amSynth-${pkgver}

  sed -i -e 's|/amSynth|/amsynth|' src/main.cc

  autoreconf --force --install
  ./configure --prefix=/usr
  make

  install -Dm755 src/amSynth ${pkgdir}/usr/bin/amSynth
  mkdir -p ${pkgdir}/usr/share/${pkgname}
  install -m644 skel/{Controllersrc,presets} ${pkgdir}/usr/share/${pkgname}/
}
