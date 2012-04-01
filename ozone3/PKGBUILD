# Contributor: sportscliche <mph at sportscliche dot com>
pkgname=ozone3
pkgver=1
pkgrel=1
pkgdesc="Lubuntu Precise theme"
arch=('i686' 'x86_64')
url="https://wiki.ubuntu.com/Lubuntu/Artwork/Incoming/Precise/Ozone"
license=('GPL')
depends=('gtk-engines' 'gtk-engine-unico')
optdepends=('elementary-icons: matching icon set')
source=('https://wiki.ubuntu.com/Lubuntu/Artwork/Incoming/Precise/Ozone?action=AttachFile&do=get&target=ozone3_theme.tar.gz')
md5sums=('a9e7f2ab6f51c630d38e9c7b16a4e9ba')
 
build() {
  cd $srcdir
 
  mkdir -p $pkgdir/usr/share/themes/Ozone3
  cp -R $srcdir/ozone3/* $pkgdir/usr/share/themes/Ozone3
}
