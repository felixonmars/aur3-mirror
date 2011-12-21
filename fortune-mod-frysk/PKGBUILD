# Maintainer: Sietse van der Molen <sietse@REMOVETHISvdmolen.eu>
pkgname=fortune-mod-frysk
pkgver=1.1
pkgrel=1
arch=('any')
url='http://digit.byethost31.com/'
license=('GPL')
pkgdesc="Fortune cookie file with frisian sayings"
depends=('fortune-mod')
groups=('fortune-mods')
source=('frysk') 
md5sums=('6c0db8cab81254a8ad3b46a5ef5748c3')
build() {
  cd $startdir/src

  strfile frysk frysk.dat

  install -D -m644 frysk $startdir/pkg/usr/share/fortune/frysk
  install -D -m644 frysk.dat $startdir/pkg/usr/share/fortune/frysk.dat
}
# vim: set ft=sh ts=2 et:
