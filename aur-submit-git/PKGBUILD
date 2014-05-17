# Maintainer: Pat Brisbin <pbrisbin@gmail.com>
_gitname='aur-submit'
pkgname=$_gitname-git
pkgver=0.0.0
pkgrel=3
pkgdesc="Command-line AUR package submission"
arch=('any')
url="https://github.com/pbrisbin/$_gitname"
license=('MIT')
makedepends=('git')
depends=('ruby-nokogiri')
source=("git://github.com/pbrisbin/$_gitname")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$_gitname"
  gem build "$_gitname.gemspec"
}

package() {
  cd "$_gitname"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" \
    $_gitname-*.gem -n "$pkgdir/usr/bin"
}
