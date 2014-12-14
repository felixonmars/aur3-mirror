# $Id$
# Maintainer: Chris Fordham <chris at fordham-nagy dot id dot au>
# Package Build Source: https://github.com/flaccid/archlinux-packages/blob/master/ruby-octokit/PKGBUILD

_gemname=octokit
pkgname=ruby-$_gemname
pkgver=3.7.0
pkgrel=1
pkgdesc="Simple wrapper for the GitHub API."
arch=(any)
url="https://github.com/octokit/octokit.rb"
license=('MIT')
depends=(ruby-sawyer)
makedepends=(rubygems)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('d61973459ae2f2bf324bff6664f4f6f3')

package() {
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
