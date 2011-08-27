# Maintainer: kevku <kevku@msn.com>
# Contributor:Xiang Yixiang <lovelinux229-at-gmail-dot-com>
pkgname=libppswrapper-git
pkgver=20110302
pkgrel=1
pkgdesc="A libpps wrapper"
arch=("i686" "x86_64")
url="http://code.google.com/p/totem-pps/"
license=('GPL')
if [[ "$CARCH" == 'i686' ]]; then
depends=('libpps')
makedepends=('intltool' 'git')
else
depends=('libpps' 'lib32-glibc')
makedepends=('gcc-multilib' 'intltool' 'git')
fi
provides=('libppswrapper=0.0.18.3')
conflicts=('libppswrapper')

_gitroot="git://anongit.freedesktop.org/~jinghua/libppswrapper.git"
_gitname="libppswrapper"

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

  #
  # BUILD HERE
  #

  ./autogen.sh --noconfigure
  ./configure --prefix=/usr --libexecdir=/usr/lib/libppswrapper --disable-static
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
} 

