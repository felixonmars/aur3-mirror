# Contributor: ganymede

pkgname=ramen-bin
pkgver=0.6.2
pkgrel=1
pkgdesc="A node based image and video compositor. x86_64 binary version."
url="http://ramenhdr.sourceforge.net/"
depends=('boost' 'intel-tbb' 'qt' 'ilmbase' 'openexr' 'libpng12' 'libjpeg' 'libtiff')
conflicts=('libjpeg6')
source=(http://downloads.sourceforge.net/project/ramenhdr/ramen-${pkgver}_linux64.tar.gz)
md5sums=('582e40283698130381cc1e60ffd6d87c')
arch=('x86_64')
license=('CDDL')

build() {
  mkdir $pkgdir/usr $pkgdir/usr/bin $pkgdir/usr/lib $pkgdir/usr/share $pkgdir/usr/share/icons
  install -m 755 $srcdir/ramen-$pkgver/bin/ramen.bin $pkgdir/usr/bin
  install -m 755 $srcdir/ramen-$pkgver/bin/ramen $pkgdir/usr/bin
  install -m 755 $srcdir/ramen-$pkgver/bin/rmaketiled.bin $pkgdir/usr/bin
  install -m 755 $srcdir/ramen-$pkgver/bin/rmaketiled $pkgdir/usr/bin  
  cp $srcdir/ramen-$pkgver/icons/icon.png $pkgdir/usr/share/icons/ramen.png
  cp $srcdir/ramen-$pkgver/icons/ramendoc.png $pkgdir/usr/share/icons/ramendoc.png
  cp -r $srcdir/ramen-$pkgver/lib/libOpenImageIO.so $pkgdir/usr/lib
  cp -r $srcdir/ramen-$pkgver/lib/libboost_thread* $pkgdir/usr/lib
  # Ugly hack to support libjpeg.so.62 and libtiff.so.4
  # aur/libjpeg6 causes a segmentation error
  ln -s /usr/lib/libjpeg.so.8.0.2 $pkgdir/usr/lib/libjpeg.so.62
  ln -s /usr/lib/libtiff.so.3 $pkgdir/usr/lib/libtiff.so.4
}
