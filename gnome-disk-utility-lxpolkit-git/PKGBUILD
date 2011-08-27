# Maintainer: Graham Rogers <grogers3.14@googlemail.com>
# gnome-keyring Maintainer: Marti Raudsepp <marti@juffo.org>
# Original author: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-disk-utility-lxpolkit-git
pkgver=20100426
pkgrel=1
pkgdesc="Graphical interface for UDisks. Uses lxpolkit instead of gnome-keyring"
arch=(i686 x86_64)
url="http://library.gnome.org/users/palimpsest/stable/index-info.html.en"
license=('GPL')
depends=('dbus-glib>=0.82' 'lxpolkit-git' 'gtk2>=2.18.2' 'libunique>=1.1.2' 'udisks>=0' 'libnotify>=0.4.5' 'hicolor-icon-theme')
makedepends=('gnome-doc-utils' 'gtk-doc' 'intltool' 'gnome-common')
replaces=('gnome-mount')
provides=('gnome-disk-utility')
conflicts=('gnome-mount' 'gnome-disk-utility' 'gnome-disk-utility-git')
options=('!libtool' '!emptydirs')
install=gnome-disk-utility.install
source=()

_gitroot="git://git.gnome.org/gnome-disk-utility"
_gitname="gnome-disk-utility"

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

  ./autogen.sh \
    --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib/gnome-disk-utility \
    --disable-scrollkeeper --disable-nautilus || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}
