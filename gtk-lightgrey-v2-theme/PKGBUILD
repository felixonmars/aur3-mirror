
# Contributor: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=gtk-lightgrey-v2-theme
pkgver=1
pkgrel=2
pkgdesc="A simple and clean theme."
arch=('i686' 'x86_64')
url="http://xfce-look.org/content/show.php/LightGreyV2-GUIKit?content=102190"
license=('CCPL:by-sa')
source=('http://home.comcast.net/~synthead/mirror/LightGreyV2_GUIKit_by_sixsixfive.tbz')
md5sums=('d8a77f8f5258c6e3b32175ab71b45335')

build() {
  mkdir -p $pkgdir/usr/share/themes
  cp -R $srcdir/LightGreyV2.guikit/cp\ to\ usr-share-themes/* $pkgdir/usr/share/themes
}
