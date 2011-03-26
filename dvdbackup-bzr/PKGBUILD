# Contributor: dan saul <aur@cryingwolf.org>
# Contributor: Nick B <Shirakawasuna at gmail _dot_ com>
# Contributor: Iven Day <ivenvd@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=dvdbackup-bzr
pkgver=88
pkgrel=1
pkgdesc="Backup contents of video-dvd to harddisk"
arch=('i686' 'x86_64')
depends=('glib2' 'libdvdread')
makedepends=('gettext')
conflicts=('dvdbackup')
provides=('dvdbackup')
license=('GPL3')
url=http://dvdbackup.launchpad.net/
_bzrtrunk=lp:dvdbackup
_bzrmod=dvdbackup

build() {
  cd $srcdir
  msg "Bazaar Checkout..."
  if [[ -d $_bzrmod/.bzr ]]; then
    (cd $_bzrmod && bzr update -v && cd ..)
    msg "Local checkout updated or server timeout"
  else
    bzr co --lightweight -v $_bzrtrunk $_bzrmod
    msg "Checkout done or server timeout"
  fi

  cp -r dvdbackup dvdbackup-build
  cd dvdbackup-build
  msg "Starting build..."
  autopoint 
  autoreconf --install 
  ./configure --prefix=/usr 
  make 
  make DESTDIR=$pkgdir install 
}

