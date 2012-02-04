# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=meego-menus-git
pkgver=20110219
pkgrel=1
pkgdesc="The default menus for MeeGo"
arch=('i686' 'x86_64')
url="http://meego.com"
license=('GPL')
groups=('meego')
depends=()
makedepends=('git' 'intltool')
provides=('meego-menus')
conflicts=('meego-menus')

_gitroot="git://gitorious.org/meego-netbook-ux/meego-menus.git"
_gitname="meego-menus"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  ./autogen.sh
  ./configure --prefix=/usr \
    --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir" install

  mv ${pkgdir}/etc/xdg/menus/applications.menu \
    ${pkgdir}/etc/xdg/menus/meego-applications.menu
  mv ${pkgdir}/etc/xdg/menus/settings.menu \
    ${pkgdir}/etc/xdg/menus/meego-settings.menu
} 
