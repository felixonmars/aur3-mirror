# Maintainer: 404
# Contributor: Artyom Smirnov <smirnoffjr@gmail.com>
# Contributor: Andrea Fagiani <andfagiani {at} gmail {dot} com>
# Contributor: carstene1ns <url/mail: arch carsten-teibes de>

_pkgbase=notify-osd
pkgname=$_pkgbase-bzr
pkgver=r479
pkgrel=1
pkgdesc="On-screen notification display agent, with semi-transparent click-through bubbles."
url="https://edge.launchpad.net/notify-osd"
license=('GPL')
arch=('i686' 'x86_64')
depends=('gconf' 'cairo' 'dbus-glib' 'libwnck3' 'hicolor-icon-theme')
makedepends=('bzr' 'gnome-common' 'libnotify')
conflicts=('notification-daemon' 'notify-osd')
provides=('notification-daemon' 'notify-osd')
install=$pkgname.install
source=("bzr+lp:notify-osd"
        "3sec.patch"
        "dynamic.patch"
        "notify-osd-0.9.30-libnotify-0.7.patch")
md5sums=('SKIP'
         '6e9b159bf29219d08c7c73cb7f5e93db'
         '5d866067d9416cfe083c4e86a90e9f2e'
         'fd9805ac596194d0350ddaca9a4c81d4')

pkgver() {
  cd $_pkgbase
  printf "r%s" "$(bzr revno)"
}

prepare() {
  cd $_pkgbase

  # change default 10s timeout to 3s
  patch -Np1 < ../3sec.patch
  # set dynamic slot allocation
  patch -Np1 < ../dynamic.patch
  # deprecated patch, leaving here for reference
  #patch -Np1 < ../notify-osd-0.9.30-libnotify-0.7.patch
}

build() {
  cd $_pkgbase

  ./autogen.sh --prefix=/usr --libexecdir=/usr/lib/notify-osd
  make
}

package() {
  cd $_pkgbase

  make DESTDIR="$pkgdir" GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 install
}
