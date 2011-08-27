# Maintainer: Arnaud Durand-Favreau <biginoz at FREE point FR>


pkgname=nautilus-gkim
pkgver=0.6.1
pkgrel=1
pkgdesc="KIM version gnome version (nautilus script)"
arch=('any')
url="http://mathix.org/gkim"
license=('GPL')
depends=('zenity' 'jhead' 'stapler')
install=nautilus-gkim.install
source=(dewslider.swf GKIM_album GKIM_slideshow index.part1 index.part2 index.part1_gallery index.part2_gallery GKIM_gallery  GKIM_fusionpdf  GKIM_resize GKIM_autorotate)
conflicts=(xfce4-gkim)

md5sums=('e753e308b29dbfd62528d7f78e76639b'
         '7f76182d51f44feb57002e91084128e9'
         '8a51fe2157ccd09ec161a567199fa437'
         '9f33ef3906e99a86e9d4a22dc6b59a02'
         'd0e31256adf320c1b94c5ebe5f13cd65'
         'b535a0517fedb5309a0ca02900ae1f25'
         '2ea18d246ac5688b606455f19b0112db'
         'aca182b2c288c31467dee22153627670'
         'bd9ef7c1eeb989323b4713771e10d240'
         '081f2af4539428037a3b974250ec94ac'
         '173e064b7681da2293db773192bddcdc')



build() {

  cd $startdir/src/
  install -d $startdir/pkg/usr/share/GKIM && \
  install -d $startdir/pkg/usr/share/nautilus-scripts && \
  install -d $startdir/pkg/usr/share/GKIM/slideshow && \
  install -d $startdir/pkg/usr/share/GKIM/gallery && \
  install -m 755 -o 0 -g 0 GKIM_fusionpdf $startdir/pkg/usr/share/nautilus-scripts && \
  install -m 755 -o 0 -g 0 GKIM_gallery $startdir/pkg/usr/share/nautilus-scripts && \
  install -m 755 -o 0 -g 0 GKIM_album $startdir/pkg/usr/share/nautilus-scripts && \
  install -m 755 -o 0 -g 0 GKIM_slideshow $startdir/pkg/usr/share/nautilus-scripts && \
  install -m 755 -o 0 -g 0 GKIM_autorotate $startdir/pkg/usr/share/nautilus-scripts && \
  install -m 755 -o 0 -g 0 GKIM_resize $startdir/pkg/usr/share/nautilus-scripts && \

  cp index.part1 $startdir/pkg/usr/share/GKIM/slideshow
  cp index.part2 $startdir/pkg/usr/share/GKIM/slideshow
  cp index.part1_gallery $startdir/pkg/usr/share/GKIM/gallery
  cp index.part2_gallery $startdir/pkg/usr/share/GKIM/gallery
  cp dewslider.swf $startdir/pkg/usr/share/GKIM/slideshow

}
