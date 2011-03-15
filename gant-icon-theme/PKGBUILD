
pkgname=gant-icon-theme
pkgver=0.3
pkgrel=2
pkgdesc="Icon theme for KDE4."
arch=('any')
depends=('kdebase-runtime' 'imagemagick')
url="http://shirakawasuna.deviantart.com/art/GANT-for-KDE-0-3-53410957?q=boost%3Apopular%20in%3Acustomization%2Ficons%2Fos%2Fnix%20kde&qo=8"
license=('LGPL')
source=(http://fc07.deviantart.net/fs17/f/2007/163/1/8/GANT_for_KDE___0_3_by_Shirakawasuna.gz
patch)
md5sums=('602ab13edb428fa846af77f52fc4ae46'
	 '4e54ca67f28f070dfedfffa585a7dfa0')

build() {
  REQUIRED_SIZES="32x32 22x22 16x16"
  SIZES="128x128 96x96 72x72 64x64 48x48 $REQUIRED_SIZES"

  cd ${srcdir}
  tar xvf GANT_for_KDE___0_3_by_Shirakawasuna.gz
  patch -Np1 -i patch
  cd GANT*
  ./buildset
  install -d ${pkgdir}/usr/share/icons/gant
  cd GANT*
 for size in $SIZES
 do
	cp -fR $size ${pkgdir}/usr/share/icons/gant
 done
 cp index.desktop ${pkgdir}/usr/share/icons/gant
}
