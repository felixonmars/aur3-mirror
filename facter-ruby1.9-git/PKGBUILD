# Maintainer: Thomas S Hatch <thatch45 (at) Gmail.com>

pkgname=facter-ruby1.9-git
pkgver=20110301
pkgrel=1
pkgdesc="A library for collecting facts about your system."
arch=("any")
url="http://puppetlabs.com/projects/facter/"
license=("GPL")
depends=("ruby")
conflicts=("facter" "facter-ruby1.9")
makedepends=('git')
options=(!emptydirs)
source=()

_gitroot="git://github.com/puppetlabs/facter.git"
_gitname="facter"

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

package() {
  cd $srcdir/facter-build

  ruby ./install.rb \
      --destdir=$pkgdir \
      --bindir=/usr/bin \
      --sbindir=/usr/sbin
  
}

