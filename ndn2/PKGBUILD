# Maintainer: lspci <agm2819 at gmail dot com>
# Contributor: Joao Cordeiro <jlcordeiro at gmail dot com>
# Contributor: archtux <antonio.arias99999@gmail.com>

pkgname=ndn2
pkgver=2.31.5309
pkgrel=3
pkgdesc="Necromancer's Dos Navigator is a clone of the famous 'Norton Commander' with added features (working copy of the ndn PKGBUILD)"
arch=('i686' 'x86_64')
url="http://ndn.muxe.com/"
install=ndn.install
license=('custom')
source=(https://sites.google.com/site/aarchived/s/ndn_2_31_5309_bin_lnx.tgz)
md5sums=('cebc54adfda9aeddd8a6bc1d60bc87a1')
conflicts=('ndn')
build() {
  cd $startdir

  mkdir $pkgdir/opt
  cp -R src/ $pkgdir/opt/ndn
  chmod 777 -R $pkgdir/opt/ndn
}
