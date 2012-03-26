# Maintainer: Leif Walsh <leif dot walsh at gmail dot com>
# Contributor: Michal Gawronski <dinth1906@gmail.com>

pkgname=dropbox-ubuntu-mono-light
pkgver=2.0
pkgrel=2
pkgdesc="Dropbox 0.8x icons for ubuntu-mono icon theme - light version."
arch=('any')
url="http://gnome-look.org/content/show.php/Dropbox+Ubuntu+Mono?content=124435"
license=('CC-BY-30')
depends=('dropbox-experimental')
makedepends=()
provides=()
conflicts=('dropbox-humanity-dark-icons' 'dropbox-dark-panel-icons' 'dropbox-humanity-icons' 'dropbox-light-panel-icons' 'dropbox-ubuntu-mono-dark')
source=('http://gnome-look.org/CONTENT/content-files/124435-dropbox-ubuntu-mono.tar.gz')
md5sums=('ebf05750fbefaa65bc87260d04d65dd9')

build() {
  cd $srcdir
  tar zxvf ./dropbox-ubuntu-mono-light.tar.gz || return 1
  cd .dropbox-dist/icons
  mv blank.png dropboxstatus-blank.png
  mv busy2.png dropboxstatus-busy2.png
  mv busy.png dropboxstatus-busy.png
  mv idle.png dropboxstatus-idle.png
  mv logo.png dropboxstatus-logo.png
  mv x.png dropboxstatus-x.png
}

package() {
  cd $srcdir/.dropbox-dist/icons
  mkdir -p $pkgdir/opt/dropbox/icons
  cp * $pkgdir/opt/dropbox/icons
}