# Contributor: Christophe Meyer <stombi@gmail.com>
pkgname=filezilla-tango-icons
pkgver=0.1.2
pkgrel=1
pkgdesc="Tango icon theme for filezilla."
arch=('i686' 'x86_64')
url="http://stombi.free.fr/archlinux/"
license=('GPL')
depends=(filezilla)
source=(http://stombi.free.fr/archlinux/filezilla-tango-icons/$pkgname-$pkgver-1.tar.gz)
md5sums=('cfebeb4494efa0e3544cfe8c19d8f74c')

build() {
  cd "$startdir/src/$pkgname"
  mkdir -p $startdir/pkg/usr/share/filezilla/resources
  # Installing icons
  cp -R $startdir/src/$pkgname/* $startdir/pkg/usr/share/filezilla/resources/
}
