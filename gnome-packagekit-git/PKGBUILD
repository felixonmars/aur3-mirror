# Maintainer: Shanto <shanto@hotmail.com>
# Contributor: onestep_ua <onestep@ukr.net>
# Contributor: Madek <gonzaloseguel@gmail.com>
# Contributor : Fplolz <fpoloz@gmail.com>

_pkgname=gnome-packagekit
pkgname=${_pkgname}-git
pkgver=20110415
pkgrel=2
_gitroot="git://git.gnome.org/gnome-packagekit"
_gitname="gnome-packagekit"
pkgdesc="Gnome tool for PackageKit, with pacman support"
arch=('i686' 'x86_64')
url="http://packagekit.org/"
license=('GPL')
depends=('packagekit' 'dconf' 'dbus' 'dbus-glib' 'glib2' 'gtk3' 'libcanberra' 'upower' 'fontconfig')
# FIXME: depends are not accurate.
optdepends=()
makedepends=('gtk-doc' 'intltool' 'git')
conflicts=('gnome-packagekit')
provides=('gnome-packagekit')
install=${_pkgname}.install
source=()
md5sums=()

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
  ./configure --prefix=/usr --sysconfdir=/etc --disable-gtk-doc --disable-scrollkeeper
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}