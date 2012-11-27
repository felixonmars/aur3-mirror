# Maintainer: Alexandr Skurikhin <askurihin@gmail.com>
pkgname=bm-git
pkgver=20121127
pkgrel=1
pkgdesc="dropbox persisted bookmarks in your terminal"
arch=('any')
license=('MIT')
url="https://github.com/visionmedia/bm"
depends=('bash')
makedepends=('git')
source=(bm-git.install)
md5sums=('4857b4261526d3f84b3d9d4e0a2336d4')

_gitroot="git://github.com/visionmedia/bm.git"
_gitname="bm"

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

}

package(){
    cd "$srcdir/$_gitname-build"
    fakeroot_dir=$pkgdir/usr/bin
    mkdir -p $fakeroot_dir
    make PREFIX=$pkgdir/usr install
}
