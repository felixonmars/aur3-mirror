# Previous Contributor: pressh <pressh at gmail dot com>
# Previous Contributor: Jessehk
# Contributor: Vinzenz Vietzke <vinz@archlinux.us>
pkgname=grafburn  
pkgver=0.10.93
pkgrel=6
pkgdesc="A CD/DVD burning application intended to be small, simple, and easy to navigate"
arch=('i686' 'x86_64')
url="http://www.grafpup.org/"
depends=('libglade' 'gtkdialog' 'cdrkit' 'cdrdao' 'gxmessage' 'xorg-apps' 'xterm' 'eject' 'xdialog')
optional=('dvd+rw-tools')
license=('GPL2' 'LGPL')
source=(http://www.puppylinux.ca/tpp/Grafpup/packages/2.xx/${pkgname}-${pkgver}.tar.gz)
install=grafburn.install
md5sums=('9abacb7b335c45afceb92e01974ff6a8')

build() {
  mkdir -p $startdir/pkg/usr/share
  
  # change gtkdialog3 to gtkdialog in all scripts
  find $startdir/src/$pkgname-$pkgver/usr/local/apps/Media/Grafburn \
  	-type f -exec sed -i 's/gtkdialog3/gtkdialog/' {} \;
  	
  find $startdir/src/$pkgname-$pkgver/usr/local/apps/Media/Grafburn \
    -type f -exec sed -i 's/\/root/$HOME/' {} \;

  find $startdir/src/$pkgname-$pkgver/usr/local/apps/Media/Grafburn \
    -type f -exec sed -i 's/rxvt/xterm/' {} \;

  sed -i 's| tr \\n| tr '\'' '\'' '\''\\n'\''|g' $startdir/src/$pkgname-$pkgver/usr/local/apps/Media/Grafburn/chooser
  	
  cp -rf $startdir/src/$pkgname-$pkgver/usr/local/apps/Media/Grafburn \
  	$startdir/pkg/usr/share/$pkgname
  	
  # patch and install executable
  sed -i 's/local\/apps\/Media\/Grafburn/share\/grafburn/' \
  	$startdir/src/$pkgname-$pkgver/usr/local/bin/grafburn
  install -Dm755 $startdir/src/$pkgname-$pkgver/usr/local/bin/grafburn \
  	$startdir/pkg/usr/bin/grafburn
  
  # install desktop file
  install -Dm644 $startdir/src/$pkgname-$pkgver/usr/share/applications/Grafburn.desktop \
  	 $startdir/pkg/usr/share/applications/grafburn.desktop
  
  # remove unneeded files
  find $startdir/pkg -type f -name gpl.txt -exec rm -rf {} \;
  find $startdir/pkg -type f -name grafburn.html -exec rm -rf { } \;
}

