# Maintainer: Joris Steyn <jorissteyn@gmail.com>
# Contributor: Adam Lloyd <lloyda2 (at) rpi (dot) edu>
pkgname=ruby-syntax
pkgver=1.0.0
pkgrel=2
pkgdesc="Syntax - lexical analysis for syntax highlighting"
arch=(any)
url="http://syntax.rubyforge.org/"
# todo: correct license issue (is bsd?)
license=('unknown')
depends=(ruby)
makedepends=(rubygems)
source=(http://gems.rubyforge.org/gems/syntax-$pkgver.gem)
noextract=(syntax-$pkgver.gem)
md5sums=('d9d2eabc03bc937adfa00e35f228f9a8')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install \
    -i "$pkgdir$_gemdir" syntax-$pkgver.gem
}

# vim:set ts=2 sw=2 et:
