# Contributor: Johann Klähn <kljohann@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=josm-smallscreen
pkgver=latest
pkgrel=3
pkgdesc="An editor for OpenStreetMap written in Java. -smallscreen is a version with smaller toolbar-icons."
arch=('any')
url="http://josm.openstreetmap.de/"
license=('GPL')
provides=('josm')
depends=('java-environment')
makedepends=('fastjar' 'imagemagick')
conflicts=('josm')
source=(http://josm.openstreetmap.de/download/josm-latest.jar josm.sh resize-plugins.sh)
md5sums=('45d503d09f2959751880d0fd42f32acf'
         '6c9df3ce061829329470012f3ff42ef6'
         'f2ff9901dec9e1b4e67f8d8cc1522257')
noextract=(josm-latest.jar)
build() {
  mkdir -p josm; cd josm
  
  echo Extracting jar-file
  fastjar -xf ../josm-latest.jar
  echo 

  for image in `find -iname '*.png'`; do
    size=`identify $image | cut -f 3 -d ' ' | cut -f 1 -d x`
    if [ $size -ge 24 -a $size -le 48 ]; then
      echo Resizing $image "(was $size)"
      convert $image -resize 60% $image
    fi
  done

  # Create unsigned jar-file
  sed '/^\s\?$/q' -i META-INF/MANIFEST.MF
  rm -f META-INF/*.RSA META-INF/*.SF

  echo Compressing jar-file
  fastjar -cfm ../josm.jar META-INF/MANIFEST.MF *

  cd "$srcdir"
  install -D -m644 josm.jar $pkgdir/usr/share/java/josm/josm.jar
  install -D -m755 josm.sh $pkgdir/usr/bin/josm
  install -D -m755 resize-plugins.sh $pkgdir/usr/bin/josm-resize-plugins
}
