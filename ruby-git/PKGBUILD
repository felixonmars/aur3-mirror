# $Id$
# Maintainer: Chris Fordham <chris at fordham-nagy dot id dot au> aka flaccid
# Contributor: Christopher Eby <kreed@kreed.org>
# Package Build Source: https://github.com/flaccid/archlinux-packages/blob/master/ruby-git/PKGBUILD

pkgname=ruby-git
_gemname=git
pkgver=1.2.8
pkgrel=1
pkgdesc="Ruby/Git is a Ruby library that can be used to create, read and manipulate Git repositories by wrapping system calls to the git binary."
arch=(any)
url="https://github.com/schacon/ruby-git"
license=('MIT')
depends=('ruby' 'git')
makedepends=('rubygems')
source=(http://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('5ed71a187f81a1aee018d8d2af345e92')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e 'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" $_gemname-$pkgver.gem
}

# vim:set ts=2 sw=2 et:
