# Contributor: Christophe Meyer <stombi@gmail.com>
pkgname=filezilla-gnome-colors-icons
pkgver=0.1.0
pkgrel=1
pkgdesc="GNOME-Colors icon themes for filezilla."
arch=('i686' 'x86_64')
url="http://stombi.free.fr/archlinux/"
license=('GPL')
depends=(filezilla)
source=(http://stombi.free.fr/archlinux/filezilla-gnome-colors-icons/$pkgname-$pkgver-1.tar.gz)
md5sums=('322da60eea49e202aad2dbee178c223b')

build() {
  cd "$startdir/src/$pkgname"
  mkdir -p $startdir/pkg/usr/share/filezilla/resources
  # Installing icons
  cp -R $startdir/src/$pkgname/* $startdir/pkg/usr/share/filezilla/resources/
}
