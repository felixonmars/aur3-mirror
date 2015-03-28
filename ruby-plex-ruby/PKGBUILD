# $Id$
# Maintainer: Chris Fordham <chris at fordham-nagy dot id dot au> aka flaccid

pkgname=ruby-plex-ruby
_gemname=plex-ruby
pkgver=1.5.2
pkgrel=1
pkgdesc="Extracts the Plex Media Server API into easy to write ruby code."
arch=(any)
url="https://github.com/ekosz/Plex-Ruby"
license=('custom')
depends=(
	ruby
	ruby-nokogiri
)
makedepends=('rubygems')
source=(http://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('7b9b3e53538e5de2595743eab54b5784')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e 'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" $_gemname-$pkgver.gem
}
