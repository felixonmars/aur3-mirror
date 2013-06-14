# Maintainer: Zhengyu Xu <xzy3186[at]gmail[dot]com>
# Contributor: Bernd Pruenster <bernd.pruenster[at]gmail[dot]com>
pkgname=gtk-theme-preferences-git
pkgver=9937cea
pkgrel=1
pkgdesc="A tool, also called gtk-theme-config, to configure GTK theme colors."
url="https://github.com/satya164/gtk-theme-config"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('gtk3' 'glib2')
conflicts=('gtk-theme-config-git' 'gtk-theme-config')
makedepends=('git' 'vala')
source="git://github.com/satya164/gtk-theme-config"
md5sums=('SKIP')

_gitname=gtk-theme-config

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "${srcdir}/$_gitname"
  make PREFIX=/usr
}

package() {
  cd "${srcdir}/$_gitname"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
