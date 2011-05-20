# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Contributor: demonicmaniac <demonicmaniac@gmx.net>
pkgname=chstandard
pkgver=6.3.0
pkgrel=1
pkgdesc="softintegration Ch student"
arch=('i686' 'x86_64')
url="http://www.softintegration.com"
license=('custom')
groups=()
depends=('libxp' 'libxaw' 'libxtst' 'libgl' 'glut')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)

case "$CARCH" in
	i686)
	_bldarch='linux2.4.20.intel'
	md5sums=('e5b01780e91e65f8c3f9092d46057716');;
	x86_x64)
	_bldarch='linux64-2.6.18.intel'
	md5sums=('f2add0cd7381e51b6b6872d54701f16b');;
esac

source=(${pkgname}-${pkgver}.${_bldarch}.tar.gz)
noextract=()

 

build() {
  cd "${srcdir}/${pkgname}-${pkgver}.${_bldarch}"

  tar -xvvzf ch.bin
  rm install.sh
  rm ch.bin
  mkdir -p ${pkgdir}/opt/ch${pkgver}
  install -d  ${pkgdir}/opt/ch${pkgver}/
  mv * ${pkgdir}/opt/ch${pkgver}/
  
  mkdir -p ${pkgdir}/bin
  for i in `ls ${pkgdir}/opt/ch${pkgver}/bin`; do ln -s ${pkgdir}/opt/ch${pkgver}/bin/$i ${pkgdir}/bin/$i; done
  
}

# vim:set ts=2 sw=2 et:
