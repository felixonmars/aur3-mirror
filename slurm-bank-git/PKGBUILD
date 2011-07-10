# Maintainer: Jimmy Tang <jtang@tchpc.tcd.ie>

pkgname=slurm-bank-git
pkgver=20110710
pkgrel=1
pkgdesc="SLURM Bank, a collection of wrapper scripts to give slurm GOLD like capabilities for managing resources."
arch=('i686' 'x86_64')
url="https://github.com/jcftang/slurm-bank"
license=('GPL')
makedepends=('git' 'ikiwiki' 'perl' 'bash')
depends=('perl' 'bash')

_gitroot="git://github.com/jcftang/slurm-bank.git"
_gitname="slurm-bank"

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
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  make || exit 1
}

package() {
  cd "$srcdir/$_gitname-build"

  make install DESTDIR=$pkgdir || exit 1
  make install-docs DESTDIR=$pkgdir || exit 1
}
# vim:set ts=2 sw=2 et:
