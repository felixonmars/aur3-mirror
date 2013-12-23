# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>
_gemname=musicbrainz
pkgname=ruby-$_gemname
pkgver=0.7.6
pkgrel=1
pkgdesc="MusicBrainz Web Service wrapper with ActiveRecord-style models"
arch=(any)
url="https://github.com/localhots/musicbrainz"
license=('MIT')
depends=(ruby ruby-faraday ruby-nokogiri) # Full dependency information is available in the yaml specification
makedepends=(rubygems)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('221d20d3b1739c69dcb4dd38373035a7')

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
