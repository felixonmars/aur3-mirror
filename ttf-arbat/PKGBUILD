# Maintainer: PDG ~sHyLoCk~ <pdg@archlinux.us>
pkgname=ttf-arbat
pkgver=1.0
pkgrel=1
pkgdesc="A free True Type Font"
arch=('i686' 'x86_64')
url="http://www.free-fonts-ttf.org/true-type-fonts/arbat-7531-download.htm"
license=('Free')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
source=(http://www.free-fonts-ttf.org/true-type-fonts/download.php?image_id=7531
http://www.free-fonts-ttf.org/true-type-fonts/download.php?image_id=7532)
md5sums=('d490ca53ead76c06f12279227cfc01f4'
         '8d56bfcdcf2da21d59d2af4618260802')
build() {
  cd $srcdir/
   mv download.php?image_id=7531 arbat.ttf
   mv download.php?image_id=7532 arbat-bold.ttf
   mkdir -p  $pkgdir/usr/share/fonts/TTF
  install -m644 *.ttf ${startdir}/pkg/usr/share/fonts/TTF/
}