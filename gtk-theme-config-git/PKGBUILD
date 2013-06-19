# Maintainer: Diego Principe <cdprincipe@at@gmail@dot@com>

pkgname=gtk-theme-config-git
_pkgname=gtk-theme-config
pkgver=89.9937cea
pkgrel=1
pkgdesc="A tool to configure GTK+ theme colors"
arch=('i686' 'x86_64')
url="https://github.com/satya164/gtk-theme-config"
license=('GPL3')
depends=('gconf' 'gsettings-desktop-schemas' 'hicolor-icon-theme')
makedepends=('git' 'vala')
optdepends=('xfconf: Xfce themes support')
provides=('gtk-theme-config')
conflicts=('gtk-theme-config')
install=$pkgname.install
source=('git://github.com/satya164/gtk-theme-config.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}/${_pkgname}"
  make PREFIX=/usr
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="$pkgdir" install
}

