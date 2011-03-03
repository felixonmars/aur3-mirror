# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=mutter-meego-git
pkgver=20110303
pkgrel=1
pkgdesc="MeeGo Netbook plugin for Metacity Clutter, aka, Mutter"
arch=('i686' 'x86_64')
url="http://meego.com"
license=('GPL')
groups=('meego')
depends=('meego-mutter-git' 'libxss' 'clutter-gtk>=0.11.4'
        'meego-gnome-control-center-git')
makedepends=('git' 'intltool' 'gtk-doc')
provides=('mutter-meego')
conflicts=('mutter-meego')
options=('!libtool')
install=mutter-meego.install

_gitroot="git://gitorious.org/meego-netbook-ux/mutter-meego.git"
_gitname="mutter-meego"

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
    --sysconfdir=/etc \
    --libexec=/usr/lib
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir/" install

  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/mutter-meego.schemas" \
    --domain mutter-meego ${pkgdir}/etc/gconf/schemas/*.schemas
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
} 
