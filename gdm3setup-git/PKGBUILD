# Maintainer: Diego Principe <cdprincipe@at@gmail@dot@com>

_pkgname=gdm3setup
pkgname=gdm3setup-git
pkgver=c3f508f
pkgrel=1
pkgdesc="A GUI to configure GDM3, autologin options and change Shell theme"
arch=(any)
license=('GPL')
url="http://github.com/Nano77/gdm3setup"
depends=('gdm' 'gnome-shell' 'python2-lxml' 'python2-dbus' 'gdm3setup-utils-git')
conflicts=('gdm3setup' 'gdm3setup-utils' 'gdm3setup-native-theme' 'gdm3setup-vala' 'gdm3setup-vala-native-theme')
source=(git://github.com/Nano77/gdm3setup.git)
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --always | sed 's|-|.|g'
}

build() {
  cd $_pkgname

  make 
}

package() {
  cd $_pkgname

  make DESTDIR=${pkgdir} install
}
