# Maintainer: Yosef Or Boczko <yoseforb@gmail.com>

_pkgname=gnome-icon-theme-symbolic
pkgname=$_pkgname-git
pkgver=3.8.3.1.gbc0a427
pkgrel=1
pkgdesc="GNOME icon theme, symbolic icons"
arch=(any)
depends=('gtk-update-icon-cache' 'icon-naming-utils' 'hicolor-icon-theme')
makedepends=('git' 'intltool')
url="http://www.gnome.org"
license=('GPL')
install=$_pkgname.install
groups=('gnome')
conflicts=('gnome-icon-theme-symbolic')
replaces=('gnome-icon-theme-symbolic')
provides=('gnome-icon-theme-symbolic' 'gnome-icon-theme-symbolic=3.8.3')
source=('git://git.gnome.org/gnome-icon-theme-symbolic')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$srcdir/$_pkgname"  
  GTK_UPDATE_ICON_CACHE=/bin/true ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}
