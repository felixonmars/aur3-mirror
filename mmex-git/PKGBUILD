# Maintainer: Igor Borges <igor@borges.me>
 
_pkgname=mmex
pkgname=mmex-git
pkgver=1.2.0
pkgrel=2
pkgdesc="Money Manager Ex"
arch=('i686' 'x86_64')
url="http://www.moneymanagerex.org/"
license=('GPL')
depends=('wxgtk' 'webkitgtk2' 'bakefile')
makedepends=('git' 'gettext')
provides=('mmex')
conflicts=('mmex')
options=(!strip)
source=("$_pkgname::git://github.com/moneymanagerex/moneymanagerex.git")
md5sums=('SKIP')
install=${_pkgname}.install
 
pkgver() {
  cd "$_pkgname"

  # Get new tags from remote
  git fetch --tags

  # Get latest tag name
  latestTag=$(git describe --tags `git rev-list --tags --max-count=1`)

  # Checkout latest tag
  git checkout $latestTag
}
 
prepare() {
  cd "$_pkgname"
  git submodule update --init
}
 
build() {
  cd "$_pkgname"
  sed -ie "s/\/usr\/local\/share\/aclocal/\/usr\/share\/aclocal/g" bootstrap
  ./bootstrap
  ./configure --prefix=/usr \
        --enable-unicode \
        --enable-shared \
        --with-wxshared \
        --with-gtk \
        --with-wx-config=/usr/lib/wx/config/gtk2-unicode-3.0 \
  LIBS="-ldl -lm -lpthread $(pkg-config webkitgtk-3.0 --cflags --libs)"
  make -j4
}
 
package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install
}

install() {
  gtk-update-icon-cache "${pkgdir}/usr/share/icons/hicolor"
}
