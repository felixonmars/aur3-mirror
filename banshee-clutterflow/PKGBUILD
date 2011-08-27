# Contributor: uastasi <uastasi@archlinux.us>
pkgname=banshee-clutterflow
realname=Banshee.ClutterFlow
pkgver=0.4.1
pkgrel=1
pkgdesc="Clutter-based CoverFlow clone for Banshee"
arch=('i686' 'x86_64')
url="http://sourceforge.net/apps/wordpress/clutterflow/"
license=('GPL')
depends=('banshee' 'clutter' 'clutter-gtk') 
makedepends=('gnome-desktop-sharp')
source=(http://downloads.sourceforge.net/project/clutterflow/${realname}-${pkgver}-binaries.tar.gz)

md5sums=('8dc0882ce61d5acbb283008f3e136248')
build() {
  mkdir -p $startdir/pkg/usr/lib/banshee-1/Extensions/${realname}
  cp -R $startdir/src/*.*  $startdir/pkg/usr/lib/banshee-1/Extensions/${realname}
}
