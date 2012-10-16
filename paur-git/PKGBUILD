# Contributor: Patrick Brisbin <pbrisbin@gmail.com>
_pkgname=paur
pkgname=$_pkgname-git
_pkgver=0.0.1
pkgver=20121016
pkgrel=2
pkgdesc='POST packages to the AUR'
arch=('any')
url='https://github.com/pbrisbin/paur'
license=('MIT')
depends=('ruby', 'ruby-nokogiri')
makedepends=('git')

_gitroot='https://github.com/pbrisbin/paur.git'
_gitname=paur

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
