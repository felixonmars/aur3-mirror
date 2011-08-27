pkgname=zenity_pacgui
pkgver=0.4
pkgrel=1
pkgdesc="pacman and system configuration GUI using zenity dialogs"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/zenitypacgui/"
license=('GPL')
groups=
provides=
depends=('sudo' 'gksu' 'zenity' 'yaourt')
makedepends=()
conflicts=()
replaces=()
backup=()
install=()
source=()
md5sums=()
packager=(jorchube)

build() {
  mkdir -p $startdir/pkg/usr/bin
  install -D -m 755 $startdir/pacgui04 $startdir/pkg/usr/bin/
  install -D -m 755 $startdir/pacyaourt $startdir/pkg/usr/bin/
  mkdir -p $startdir/pkg/usr/share/applications
  install -D -m 644 $startdir/pacgui.desktop $startdir/pkg/usr/share/applications/
}
