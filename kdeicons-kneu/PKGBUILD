#Contributor: DaNiMoTh <jjdanimoth@gmail.com>

pkgname="kdeicons-kneu"
pkgver=0.2
pkgrel=2
pkgdesc="An neat iconset for KDE 3.x"
url="http://www.kde-look.org/content/show.php?content=28375"
license="LGPL"
arch=('i686' 'x86_64')
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=("http://members.home.nl/twosouls82/pub/archlinux/aur/k/kNeu-alpha-$pkgver.tar.gz")
md5sums=("3406fe4b7a435d8912defba15d6720d5")

build() {
  cd $startdir/src/
  mkdir -p $startdir/pkg/opt/kde/share/icons/
  mv "kNeu-alpha-$pkgver" "kneu"
  cp -r "kneu" $startdir/pkg/opt/kde/share/icons/
}
