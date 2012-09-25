# Contributor: Tom Vincent <http://tlvince.com/contact/>
_pkgname=raury
pkgname=$_pkgname-git
_pkgver=0.0.1
pkgver=20120925
pkgrel=1
pkgdesc='A ruby-based AUR helper'
arch=('any')
url='https://github.com/pbrisbin/raury'
license=('MIT')
depends=('ruby-paint')
makedepends=('git')

_gitroot='https://github.com/pbrisbin/raury.git'
_gitname=raury

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"

  cd "$srcdir/$_gitname-build"
  gem build "$_pkgname.gemspec"
}

package() {
  cd "$srcdir/$_pkgname-build"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" \
    $_pkgname-$_pkgver.gem -n "$pkgdir/usr/bin"
}

