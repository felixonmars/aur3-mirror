# Maintainer: Patrick Brisbin <pbrisbin@gmail.com>
pkgname=pacruft-git
pkgver=20111128
pkgrel=1
pkgdesc="Displays packages that have not been used in a while."
arch=('any')
url="https://github.com/pbrisbin/pacruft"
license=('GPL')
groups=()
depends=('ruby')
makedepends=('git' 'rubygems')
md5sums=()

_gitname="pacruft"
_gitroot="git://github.com/pbrisbin/$_gitname.git"

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

  msg "Building gem"
  cd "$srcdir/$_gitname"
  gem build "$_gitname.gemspec"
}

package() {
  cd "$srcdir/$_gitname"
  export HOME=/tmp
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies -i "${pkgdir}${_gemdir}" *.gem
} 
