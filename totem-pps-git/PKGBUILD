# Maintainer: kevku <kevku@msn.com>
# Contributor:Xiang Yixiang <lovelinux229-at-gmail-dot-com>
pkgname=totem-pps-git
pkgver=20110302
pkgrel=1
pkgdesc="PPStream browser for totem"
arch=("i686" "x86_64")
url="http://code.google.com/p/totem-pps/"
license=('GPL')
depends=('totem' 'gst-plugins-pps' 'gnome-python' 'python-beautifulsoup')
makedepends=('pkgconfig' 'intltool' 'git')
provides=('totem-pps=0.0.19.7')
conflicts=('totem-pps')
source=("python2.patch")
md5sums=('f78777a2a7583f1da6061a985e9fa124')

_gitroot="git://anongit.freedesktop.org/~jinghua/totem-pps.git"
_gitname="totem-pps"

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

  #
  # BUILD HERE
  #
  patch -Np1 -i ../python2.patch
  ./autogen.sh
  PYTHON=python2 ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
} 
