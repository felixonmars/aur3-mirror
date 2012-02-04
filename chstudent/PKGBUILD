# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Contributor: demonicmaniac <demonicmaniac@gmx.net>
pkgname=chstudent
pkgver=6.1.0
pkgrel=1
pkgdesc="softintegration Ch student"
arch=('i686')
url="http://www.softintegration.com"
license=('custom')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=('ch.install')
source=('chstudent-6.1.0.linux2.4.20.intel.tar.gz')
noextract=()
md5sums=('bb2c89b917549007dab55045f96228eb')
 

build() {
  cd "$srcdir/chstudent-6.1.0.linux2.4.20.intel"

  tar -xvvzf ch.bin
  rm install.sh
  rm ch.bin
  mkdir -p ${pkgdir}/opt/ch6.1.0
  install -d  ${pkgdir}/opt/ch6.1.0/
  mv * ${pkgdir}/opt/ch6.1.0/
  
  mkdir -p ${pkgdir}/bin
  for i in `ls ${pkgdir}/opt/ch6.1.0/bin`; do ln -s ${pkgdir}/opt/ch6.1.0/bin/$i ${pkgdir}/bin/$i; done
  
}

# vim:set ts=2 sw=2 et:
