# Maintainer: Rafał Michalski <plum.michalski at gmail dot com>
pkgname="vidir-git"
pkgver=20120403
pkgrel=1
pkgdesc="vidir allows editing of the contents of a directory in a text editor"
arch=("any")
license=("GPL")
depends=('vim' 'perl')
makedepends=('git')
conflicts=('moreutils')
install=vidir.install
url='http://github.com/trapd00r/vidir'

_gitroot="https://github.com/trapd00r/vidir.git"
_gitname="vidir"

build() {
  cd $srcdir

  msg "Connecting to GIT server..."
  if [[ -d $_gitname ]]; then
    (cd $_gitname && git pull origin) || return 1
  else
    git clone $_gitroot $_gitname || return 1
  fi
  
  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd $_gitname || return 1

  install -Dm755 ${srcdir}/${_gitname}/bin/vidir $pkgdir/usr/bin/vidir

}
