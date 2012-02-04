# Maintainer: Arnaud Durand-Favreau <biginoz at FREE point FR>


pkgname=xfce4-gkim
pkgver=0.6.4
pkgrel=1
pkgdesc="KIM version for xfce based on GKIM (gnome verion of KIM for nautilus script)"
arch=('any')
url="http://mathix.org/gkim"
license=('GPL')
depends=('zenity' 'jhead' 'stapler' 'unzip' 'unrar')
install=xfce4-gkim.install
source=(http://mathix.org/xfce4-gkim/xfce4-gkim-0.6.4.tar.bz2)
conflicts=(nautilus-gkim)
md5sums=('e7f776fcd26fe7df11bd31cbaf23bfec')



package() {

  cd $startdir/src/xfce4-gkim
  install -d $startdir/pkg/usr/share/GKIM && \
  install -d $startdir/pkg/usr/share/GKIM/slideshow && \
  install -d $startdir/pkg/usr/share/GKIM/gallery && \
  install -m 755 -o 0 -g 0 GKIM_fusionpdf $startdir/pkg/usr/share/GKIM && \
  install -m 755 -o 0 -g 0 GKIM_gallery $startdir/pkg/usr/share/GKIM && \
  install -m 755 -o 0 -g 0 GKIM_album $startdir/pkg/usr/share/GKIM && \
  install -m 755 -o 0 -g 0 GKIM_slideshow $startdir/pkg/usr/share/GKIM && \
  install -m 755 -o 0 -g 0 GKIM_autorotate $startdir/pkg/usr/share/GKIM && \
  install -m 755 -o 0 -g 0 GKIM_resize $startdir/pkg/usr/share/GKIM && \
  install -m 755 -o 0 -g 0 xfce4-gkim-modification.sh $startdir/pkg/usr/share/GKIM && \
  cp index.part1 $startdir/pkg/usr/share/GKIM/slideshow
  cp index.part2 $startdir/pkg/usr/share/GKIM/slideshow
  cp index.part1_gallery $startdir/pkg/usr/share/GKIM/gallery
  cp index.part2_gallery $startdir/pkg/usr/share/GKIM/gallery
  cp dewslider.swf $startdir/pkg/usr/share/GKIM/slideshow
  cp uca.xml $startdir/pkg/usr/share/GKIM
}
