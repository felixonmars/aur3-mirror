# Contributor: muhas <muhas@muhas.ru>

pkgname=lightgreymodded-openbox-theme
pkgver=0.1.2
pkgrel=2
pkgdesc="LightGrey openbox theme modded by muhas"
arch=('any')
license=('GPL')
url=('http://repo.muhas.ru')
source=('LightGreyModded.openbox.tar.gz')
md5sums=('30c78d1019ee2bb6ff64c752a764b935')

build() {
  mkdir -p $pkgdir/usr/share/themes/LightGreyModded 
  cp -r $srcdir/LightGreyModded/* $pkgdir/usr/share/themes/LightGreyModded
  chmod 755  $pkgdir/usr/share/themes/LightGreyModded/openbox-3
  chmod -R 644  $pkgdir/usr/share/themes/LightGreyModded/openbox-3/*
}



