# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=meego-gnome-control-center-git
pkgver=20110219
pkgrel=1
pkgdesc="The Control Center for GNOME (MeeGo version)"
arch=('i686' 'x86_64')
url="http://meego.com"
license=('GPL')
groups=('meego')
depends=('gnome-common' 'gnome-desktop' 'gnome-menus' 'libunique'
        'gnome-settings-daemon' 'mx' 'metacity' 'desktop-file-utils'
        'shared-mime-info' 'hicolor-icon-theme')
makedepends=('git' 'intltool' 'gnome-doc-utils')
provides=('meego-gnome-control-center')
conflicts=('meego-gnome-control-center' 'gnome-control-center')
install=meego-gnome-control-center.install
options=('!libtool')
source=('mx-header-path.patch')
md5sums=('9f17c42436649b0acce3ba1d9a0d35ac')

_gitroot="git://gitorious.org/meego-netbook-ux/gnome-control-center.git"
_gitname="gnome-control-center"

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

  patch -Np0 -i ${srcdir}/mx-header-path.patch

  ./autogen.sh
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --disable-update-mimedb \
    --libexec=/usr/lib
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir/" install

  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/gnome-control-center.schemas" \
    --domain gnome-control-center-2.0 ${pkgdir}/etc/gconf/schemas/*.schemas
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas

  rm ${pkgdir}/usr/share/applications/mimeinfo.cache
}
