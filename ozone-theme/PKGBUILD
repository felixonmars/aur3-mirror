# Contributor: sportscliche <mph at sportscliche dot com>
pkgname=ozone-theme
pkgver=1
pkgrel=1
pkgdesc="Lubuntu Natty theme"
arch=('i686' 'x86_64')
url="https://wiki.ubuntu.com/Lubuntu/Artwork/Incoming/Natty/Ozone"
license=('GPL')
optdepends=('xfce-theme-bluebird: matching widget set'
'elementary-icons: matching icon set')
source=('https://wiki.ubuntu.com/Lubuntu/Artwork/Incoming/Natty/Ozone?action=AttachFile&do=get&target=ozone_theme.tar.gz')
md5sums=('7eb9ee30952e5fe945a6795d7052b09a')
 
build() {
  cd $srcdir
 
  mkdir -p $pkgdir/usr/share/themes/Ozone
  cp -R $srcdir/Ozone/* $pkgdir/usr/share/themes/Ozone
}
