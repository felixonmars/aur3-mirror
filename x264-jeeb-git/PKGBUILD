# Maintainer: Felix Yan <felixonmars[at]gmail[dot]com>
# Contributor: DrZaius <lou[at]fakeoutdoorsman[dot]com>
# Contributor: zhuqin <zhuqin83[at]gmail[dot]com>
# Contributor: pressh <pressh[at]gmail[dot]com>

pkgname=x264-jeeb-git
pkgver=2120
pkgrel=1
pkgdesc="H.264/MPEG-4 AVC video encoder with JEEB's patchsets"
arch=('i686' 'x86_64')
url="http://x264.fushizen.eu/"
license=('GPL')
depends=('glibc')
makedepends=('git' 'yasm')
conflicts=('x264')
provides=("x264-git" "x264=$(LANG=C pacman -Si x264 | grep Version | awk '{ print $NF }')") 
source=(http://x264.fushizen.eu/patches/x264_2120_patches.patch)
md5sums=('439ea38cd0c2c8408af6ecd81b7c3acc')

_gitroot="https://github.com/silverfilain/x264_L-SMASH.git"
_gitorigroot="git://git.videolan.org/x264.git"
_gitname="x264_L-SMASH"

build() {
  cd $srcdir
  msg "Connecting to the GIT server...."
  
  if [[ -d $srcdir/$_gitname ]] ; then
    cd $_gitname
    git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
    cd $_gitname
    git remote add porigin $_gitorigroot
  fi
  
  msg "Merging origin..."
  cd $srcdir/$_gitname
  git fetch porigin
  git merge porigin/master
  
  msg "GIT checkout done"
  msg "Starting make..."
  
  rm -rf $srcdir/$_gitname-build
  cp -r $srcdir/$_gitname $srcdir/$_gitname-build
  
  cd $srcdir/$_gitname-build
  patch -p1 -i ../*.patch
  ./configure \
    --prefix=/usr \
    --enable-nonfree \
    --enable-static \
    --enable-shared
  
  make DESTDIR=$pkgdir install
  
  rm -rf $srcdir/$_gitname-build
}
