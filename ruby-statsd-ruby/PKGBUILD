#Maintainer: Alfredo Palhares <masterkorp@masterkorp.net>

_gemname=statsd-ruby
pkgname=ruby-$_gemname
pkgver=1.0.0
pkgrel=1
pkgdesc="A Ruby StatsD client"
arch=('any')
url="https://github.com/reinh/statsd-ruby"
license=('MIT')
depends=('ruby')
makedepends=('rubygems')
source=(http://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('eda45fb80bee7b476229df77933f9907')
sha1sums=('4d048fe5275bd8d0818af9a73eb11c8d586335a0')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -n "$pkgdir"/usr/bin -i "$pkgdir$_gemdir" $_gemname-$pkgver.gem
}
