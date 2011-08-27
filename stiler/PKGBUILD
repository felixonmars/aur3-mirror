# Contributor: Your Name <unohu0@gmail.com>
pkgname=stiler
pkgver=20090328
pkgrel=1
pkgdesc="A simple python script to convert any wm to tiling wm"
arch=(any)
url="http://bbs.archlinux.org/viewtopic.php?id=64100"
license=('BSD')
depends=(wmctrl xdotool python)
makedepends=(git)
provides=(stiler)
md5sums=() #generate with 'makepkg -g'

_gitroot="git://github.com/TheWanderer/stiler.git"
_gitname="stiler"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"

  install -D -m644   $srcdir/stiler/README $pkgdir/usr/share/doc/stiler/README
  install -D -m755   $srcdir/stiler/stiler.py $pkgdir/usr/bin/stiler

} 
