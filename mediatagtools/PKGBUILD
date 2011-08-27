# Contributor: shamrok <szamrok@gmail.com>

pkgname=mediatagtools
pkgver=0.3.2
pkgrel=1
pkgdesc="A sane taglib based tagger"
url="http://mediatagtools.berlios.de"
depends=('qt' 'taglib')
source=(http://download.berlios.de/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('66fe68707ee34c06bdbdb7f45f75caee')
arch=('i686')
license="GPL"

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  
  mkdir -p $startdir/pkg/usr/share/icons/hicolor/scalable/apps/
  mkdir -p $startdir/pkg/usr/bin/
  mkdir -p $startdir/pkg/usr/share/applications/
  mkdir -p $startdir/pkg/usr/share/mediatagtools/icons/
  
  cp -f "./translations/mtt_el.qm" $startdir/pkg/usr/share/mediatagtools/
  cp -f "./icons/logo.png" "$startdir/pkg/usr/share/mediatagtools/icons/"
  cp -f "./icons/mediatagtools.png" "$startdir/pkg/usr/share/mediatagtools/icons/"
  cp -f "./icons/mediatagtools.svg" "$startdir/pkg/usr/share/mediatagtools/icons/"
  cp -f "./bin/mediatagtools" "$startdir/pkg/usr/bin/mediatagtools"
  cp -f "./icons/mediatagtools.svg" "$startdir/pkg/usr/share/icons/hicolor/scalable/apps/"
  cp -f "./mediatagtools.desktop" "$startdir/pkg/usr/share/applications/" 
}
