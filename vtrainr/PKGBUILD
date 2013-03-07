# Maintainer: linopolus <linopolus@googlemail.com>
# Contributor: linopolus <linopolus@googlemail.com>
pkgname=vtrainr
pkgver=0.8.2
pkgrel=1
pkgdesc="V-Trainr is a vocabulary trainer I try to keep as simple as possible."
arch=('i686' 'x86_64')
url="http://launchpad.net/vtrainr"
license=('GPLv3')
depends=('pyqt3')
source=(https://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver.tar.bz2 
V-Trainr.desktop V-Convertr.desktop)
md5sums=('3a88735098fe2daf0a081abae16c6267'
         '1b9bb8974c8515ed6ac966d043a23835'
         'e4857c3bad0782458d930a58c0793dd1')

build() {
  cd $srcdir/
  mv dev vtrainr
  mkdir -p $pkgdir/usr/share/applications/
  install V-Trainr.desktop $pkgdir/usr/share/applications/
  install V-Convertr.desktop $pkgdir/usr/share/applications/
  cd vtrainr/
  mkdir -p $pkgdir/usr/share/pixmaps/
  cp pix/vtrainr.png pix/vconvertr-48x48.png $pkgdir/usr/share/pixmaps/
  mkdir -p $pkgdir/opt/
  cd ..
  cp -R vtrainr $pkgdir/opt/
  mkdir -p $pkgdir/usr/bin/
  echo "#!/bin/sh" > $pkgdir/usr/bin/vtrainr
  echo "cd /opt/vtrainr" >> $pkgdir/usr/bin/vtrainr
  echo "./vtrainr.py" >> $pkgdir/usr/bin/vtrainr
  chmod +x $pkgdir/usr/bin/vtrainr
  echo "#!/bin/sh" > $pkgdir/usr/bin/vtconvertr
  echo "cd /opt/vtrainr" >> $pkgdir/usr/bin/vconvertr
  echo "./vconvertr.py" >> $pkgdir/usr/bin/vconvertr
  chmod +x $pkgdir/usr/bin/vconvertr
  chmod 777 $pkgdir/opt/vtrainr/data/config.cfg
}
