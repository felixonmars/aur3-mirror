# Maintainer: petRUShka <petrushkin[at]yandex.ru>
pkgname=mega
pkgver=5110426
pkgrel=2
pkgdesc="Molecular Evolutionary Genetics Analysis (MEGA) is an integrated tool for conducting automatic and manual sequence alignment, inferring phylogenetic trees, mining web-based databases, estimating rates of molecular evolution, inferring ancestral sequences, and testing evolutionary hypotheses."
url="http://www.megasoftware.net/"
arch=('x86_64' 'i686')
license=('proprietary')
depends=()
#optdepends=('java-runtime')
makedepends=('wine' 'wine_gecko')
conflicts=()
replaces=()
backup=()
#install='foo.install'
source=("http://update.megasoftware.net/deb/pool/main/m/mega/${pkgname}_${pkgver}_all.deb")
md5sums=('4039adbaeb8ff9ef58445df879b568dc')

#build() {
#  cd "${srcdir}/${pkgname}-${pkgver}"
#  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
#  make
#}

package() {
  cd "${srcdir}/"
#  make DESTDIR="${pkgdir}" install
#  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  msg "Extracting the MEGA package"
  ar -xv ${pkgname}_${pkgver}_all.deb
  tar -xvf data.tar.gz
  msg2 "Done extracting!"

  msg "Preparing install"
  install -d "$pkgdir"/usr/{bin,local/applications}
  mv -v usr/local/bin "$pkgdir"/usr/local/bin
  msg2 "Done preparing!"

  msg "Actual installation"
  ln -sv /usr/local/bin/mega $pkgdir/usr/bin/
  install -D "$pkgdir/usr/local/bin/MEGA/Installers/MEGA.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  msg2 "Installation finished!"
}

# vim:set ts=2 sw=2 et:
