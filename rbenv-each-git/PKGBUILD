# Maintainer: Vincent Demeester <vincent@shortbrain.org>
pkgname=rbenv-each-git
pkgver=20130901
pkgrel=1
pkgdesc="A rbenv plugin to run a command across all installed rubies"
arch=('any')
url="https://github.com/chriseppstein/rbenv-each"
license=('MIT')
depends=('rbenv')
source=()
md5sums=()

_gitroot="git://github.com/chriseppstein/rbenv-each.git"
_gitname="rbenv-each"

build() {
      cd $srcdir
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
}

package() {
    cd $srcdir

    mkdir -p $pkgdir/usr/lib/rbenv/libexec

    install -m 755 ./$_gitname/bin/rbenv-each $pkgdir/usr/lib/rbenv/libexec/
}
