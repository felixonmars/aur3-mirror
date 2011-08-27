#Contributor: twosouls82 <twosouls82@gmail.com>

pkgname=kdeicons-kids
pkgver=1.0
pkgrel=2
pkgdesc="An iconset for KDE 3.x, for (big) kids"
url="http://www.everaldo.com/"
license=""
depends=()
makedepends=()
conflicts=("kdeartwork")
replaces=()
backup=()
install=
source=(http://www.yellowicon.com/addicons/files/kid.tar.gz)
md5sums=('dacffb8112fc1f3fef47963f833f9a4c')

build() {
  cd $startdir/src/
  mkdir -p $startdir/pkg/opt/kde/share/icons/
  cp -r kids $startdir/pkg/opt/kde/share/icons/
}
