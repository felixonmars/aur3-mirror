# Maintainer: K900 <k0009000@gmail.com>
# Contrubutor: ava1ar (mail(dot)avatar(at)gmail(dot)com)
  
pkgname=dolphin-dropbox-plugin-hg
pkgver=27
pkgrel=1
pkgdesc="KDE Dolphin plugin for Dropbox"
arch=('i686' 'x86_64')
license=('GPL')
depends=('kdebase-dolphin' 'dropbox')
makedepends=('mercurial' 'cmake' 'automoc4')
url="https://bitbucket.org/cancel/dolphin-dropbox-plugin"
source=("dolphin-dropbox-plugin::hg+https://bitbucket.org/cancel/dolphin-dropbox-plugin")
_hgrepo="dolphin-dropbox-plugin"
md5sums=('SKIP')
  
pkgver() {
  cd local_repo
  hg identify -ni | awk 'BEGIN{OFS=".";} {print $2,$1}'
}
  
build() {
  cd $srcdir
  rm -rf build
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ../$_hgrepo
  make
}
  
package() {
  cd $srcdir/build
  make DESTDIR=$pkgdir install
}
