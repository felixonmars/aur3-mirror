# Maintainer: Yosef Or Boczko <yoseforb@gmail.com>

_pkgname=gnome-icon-theme
pkgname=$_pkgname-git
pkgver=3.8.2.2.gc917253
pkgrel=1
pkgdesc="GNOME default icons"
arch=(any)
depends=('hicolor-icon-theme' 'icon-naming-utils' 'gtk-update-icon-cache' 'gnome-icon-theme-symbolic')
makedepends=('git' 'gnome-common' 'automake' 'itstool' 'libxml2' 'yelp-tools')
url="http://www.gnome.org"
license=('GPL')
groups=('gnome')
install=$_pkgname.install
options=('!emptydirs')
conflicts=('gnome-icon-theme')
replaces=('gnome-icon-theme')
provides=('gnome-icon-theme' 'gnome-icon-theme=3.8.2')
source=('git://git.gnome.org/gnome-icon-theme')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$srcdir/$_pkgname"  
  ./autogen.sh --prefix=/usr
  make
}

package() {
    cd "$srcdir/$_pkgname"  
    make DESTDIR="$pkgdir" install
    rm -f  "${pkgdir}/usr/share/icons/gnome/icon-theme.cache"
}
