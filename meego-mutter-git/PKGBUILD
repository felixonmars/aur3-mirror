# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=meego-mutter-git
pkgver=20110303
pkgrel=1
pkgdesc="The next-gen WM for GNOME, with compositing by clutter (MeeGo version)"
arch=('i686' 'x86_64')
url="http://meego.com"
license=('GPL')
groups=('meego')
depends=('gnome-common' 'gconf' 'libxcomposite' 'clutter' 'libcanberra'
        'gobject-introspection' 'zenity' 'startup-notification')
makedepends=('git' 'intltool' 'gnome-doc-utils')
provides=('meego-mutter')
conflicts=('meego-mutter' 'mutter')
options=('!libtool')
install=meego-mutter.install

_gitroot="git://gitorious.org/meego-netbook-ux/mutter.git"
_gitname="mutter"

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
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir/" install

  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/mutter.schemas" \
    --domain mutter ${pkgdir}/etc/gconf/schemas/*.schemas
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
} 
