# Maintainer: fgallina <fabian@anue.biz>

pkgname=rhythmbox-folderview-git
pkgver=1
pkgrel=1
pkgdesc="Rhythmbox Plugin To Browse Your Music By Folders"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/imdiot/rhythmbox_folder_view"
depends=('rhythmbox')
makedepends=('git')
install=(${pkgname}.install)

build() {
  cd $srcdir
  git clone https://github.com/imdiot/rhythmbox_folder_view
  mkdir -p $pkgdir/usr/lib/rhythmbox/plugins/
  cp -R rhythmbox_folder_view/FolderView/ $pkgdir/usr/lib/rhythmbox/plugins/
}
