# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

# This package represents both the new Chocolate Doom and my personal
# reflections on what might be changed about its packaging. The most
# significant of which is that I am seriously considering moving
# /usr/share/doom into a subdirectory of /usr/share/games instead, not
# having to manually patch this software for Arch, and all-around
# being a good idea to separate games into their own category in the
# filesystem.

# The other change being done here is the removal of the desktop
# entries. For what Chocolate Doom is, it's somewhat crippled by
# having an icon that only launches it without any parameters. If
# using the Terminal is really that big of a problem for Chocolate
# Doom players, perhaps finding a way to build the Cocoa/ObjC frontend
# and installing that would be a good idea, but it would introduce a
# dependency on GNUstep (make it optional?).

# Please leave comments on the AUR, especially negative feedback,
# because these changes will be incorporated into the regular
# chocolate-doom PKGBUILD otherwise!

pkgname=chocolate-doom-next
pkgver=2.0.0_beta3
pkgrel=2
pkgdesc="Doom, Heretic, Hexen, Strife port accurately reproducing the originals."
arch=('i686' 'x86_64')
url="http://www.chocolate-doom.org/"
license=('GPL2')
depends=('sdl' 'sdl_mixer' 'sdl_net')
makedepends=('autoconf' 'python')
conflicts=( ${pkgname/-next/} )
install=${pkgname/-next/}.install
source=(https://soulsphere.org/projects/${pkgname/-next/}/${pkgver/_/-}/${pkgname/-next/}-${pkgver/_/-}.tar.gz)
sha256sums=('4b131eca40d5ce00a8f37f6a18ec31c151015ef78a684eec518f915d7f8ada7a')

build() {
  cd "${pkgname/-next/}-${pkgver/_/-}"

  # Change binary dir from /usr/games to /usr/bin
  sed 's|/games|/bin|g' -i src{,/setup}/Makefile.am

  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname/-next/}-${pkgver/_/-}"

  make DESTDIR="$pkgdir" install
}
