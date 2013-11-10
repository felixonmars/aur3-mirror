# Maintainer: tuxce <tuxce.net@gmail.com>
_gitname=mate-disk-utility
pkgname=mate-disk-utility-git
pkgver=v1.6.1
pkgrel=1
pkgdesc="A fork of GNOME Disks that brings back the functionality of GNOME 2's disk utility"
arch=('i686' 'x86_64')
url="https://github.com/NiceandGently/mate-disk-utility"
license=('GPL')
depends=('desktop-file-utils' 'gnome-icon-theme-symbolic' 'gtk2' 'libcanberra'
'libdvdread' 'libnotify' 'libpwquality' 'libsecret' 'udisks2')
makedepends=('git' 'mate-settings-daemon' 'docbook-xsl' 'intltool')
conflicts=('gnome-disk-utility')
provides=('mate-disk-utility')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver () {
  cd $_gitname
  echo $(git describe --always | sed 's/-/./g')
}

build() {
  cd $_gitname
  ./autogen.sh
  ./configure --prefix=/usr
  make || return 1
}

package () {
  cd $_gitname
  make DESTDIR=$pkgdir install || return 1
}

# vim:set ts=2 sw=2 et:
