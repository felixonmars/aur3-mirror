# Maintainer: Markus Unterwaditzer <markus at unterwaditzer dot net>
# Contributor:  Jussi Timperi <jussi.timperi at gmail dot com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>

pkgname=shellshape-mutter-git
pkgver=20111110
pkgrel=1
pkgdesc="A window manager for GNOME3, forked for shellshape"
arch=(i686 x86_64)
license=('GPL')
depends=('startup-notification' 'gconf' 'zenity' 'libcanberra' 'clutter' 'gobject-introspection')
makedepends=('intltool' 'gnome-doc-utils' 'git' 'gnome-common')
conflicts=('mutter' 'shellshape-mutter')
provides=('mutter' 'shellshape-mutter')
url="http://gfxmonk.net/shellshape/"
options=('!libtool' '!emptydirs')
install=mutter.install
source=()
sha256sums=()

_gitroot="git://github.com/gfxmonk/mutter.git"
_gitname="shellshape-mutter"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
    cd $_gitname
    git checkout shellshape_3.2
    cd ..
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  git checkout shellshape_3.2

  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
    --libexecdir=/usr/lib/mutter \
    --localstatedir=/var --disable-static
  make
}

package() {
  cd "${srcdir}/$_gitname-build"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/mutter.schemas" --domain mutter ${pkgdir}/etc/gconf/schemas/*.schemas
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}

