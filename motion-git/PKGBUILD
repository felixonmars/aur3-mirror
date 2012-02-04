# Maintainer: mar77i <mysatyre at gmail dot com>
# Contributor: Demind <demind@gmail.com>
pkgname=motion-git
pkgver=20110428
pkgrel=1
pkgdesc="Motion is a software motion detector. It grabs images from video4linux devices and/or from webcams."
arch=('i686' 'x86_64')
url="http://www.lavrsen.dk/twiki/bin/view/Motion/WebHome"
license=('GPL2')
depends=('zlib' 'libjpeg')
makedepends=('subversion')
provides=('motion')
conflicts=('motion')
install="motion-git.install"
source=('rc.motion')
md5sums=('fc09828564850824f8549d258053e0b6')

_gitroot=https://github.com/sackmotion/motion.git
_gitname=motion

build() {
  cd "$srcdir"
  msg "Performing source checkout..."
  if [ -d "$_gitname" ]; then
    cd "$_gitname"
    git pull origin
    cd ..
  else
    git clone "$_gitroot"
  fi

  [ -d "./${_gitname}-build" ] && rm -rf "./${_gitname}-build"
  cp -r "./${_gitname}" "./${_gitname}-build"
  cd "./${_gitname}-build"

  msg "GIT checkout done or server timeout"
  msg "Starting build"

  sed -i 's@<linux/videodev.h>@<libv4l1.h>\n#include <linux/videodev2.h>@' *.c *.h

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc

  make
  make DESTDIR="$pkgdir" install
  install -D -m755 "$srcdir/rc.motion" "$pkgdir/etc/rc.d/motion"
}

