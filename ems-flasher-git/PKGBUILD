# Contributor: fuxter <fuxterz@gmail.com>

pkgname=ems-flasher-git
pkgver=20121123
pkgrel=1
pkgdesc='Utility to flash ROM images to the EMS USB 64 mbit gameboy flash cart on Linux'
url="http://lacklustre.net/gb/ems/"
license=("MIT")
arch=('i686')
makedepends=('git')
depends=('libusb')

_gitroot="git://lacklustre.net/ems-flasher"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."
  if [ -d $pkgname ] ; then
    cd $pkgname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $pkgname
  fi
  msg "GIT checkout done or server timeout"
  msg "Starting make..."
  cd $pkgname
  make
}

package() {
  install -Dm755 $srcdir/$pkgname/ems-flasher "${pkgdir}/usr/bin/ems-flasher"
}

# vim:set ts=2 sw=2 et:
