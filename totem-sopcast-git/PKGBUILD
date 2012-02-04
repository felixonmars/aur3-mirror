# Maintainer: kevku <kevku@msn.com>
# Contributor:Xiang Yixiang <lovelinux229-at-gmail-dot-com>
pkgname=totem-sopcast-git
pkgver=20110226
pkgrel=1
pkgdesc="sopcast browser for totem"
arch=("i686" "x86_64")
url="http://cgit.freedesktop.org/~jinghua/totem-sopcast/"
license=('GPL')
depends=('totem' 'gnome-python' 'gst-plugins-sopcast')
makedepends=('git' 'intltool')
provides=('totem-sopcast')
conflicts=('totem-sopcast')

_gitroot="git://anongit.freedesktop.org/~jinghua/totem-sopcast.git"
_gitname="totem-sopcast"

source=()
md5sums=()

build() {
  cd $srcdir

  msg "Connecting to GIT server..."
  if [[ -d $_gitname ]]; then
    (cd $_gitname && git pull origin)
  else
    git clone $_gitroot $_gitname
  fi
  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf $_gitname-build
  cp -r $_gitname $_gitname-build
  cd $_gitname-build

  PYTHON=python2 ./autogen.sh --prefix=/usr
  make 
}

package(){
  cd $srcdir/$_gitname-build
  make DESTDIR=$pkgdir install

}

