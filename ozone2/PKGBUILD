# Contributor: sportscliche <mph at sportscliche dot com>
pkgname=ozone2
pkgver=1
pkgrel=1
pkgdesc="Lubuntu Oneiric theme"
arch=('i686' 'x86_64')
url="https://wiki.ubuntu.com/Lubuntu/Artwork/Incoming/Oneiric/Ozone"
license=('GPL')
depends=('gtk-engine-murrine' 'gtk-engine-unico')
source=('https://wiki.ubuntu.com/Lubuntu/Artwork/Incoming/Oneiric/Ozone?action=AttachFile&do=get&target=ozone2.tar.gz')
md5sums=('abce2275a4e72d92498aa0b1b290f83c')
 
build() {
  cd $srcdir
 
  mkdir -p $pkgdir/usr/share/themes/Ozone2
  cp -R $srcdir/ozone2/* $pkgdir/usr/share/themes/Ozone2
}
