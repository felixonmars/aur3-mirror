# Maintainer: Alfredo Palhares <masterkorp@masterkorp.net>

_gemname=minitest-chef-handler
pkgname=ruby-$_gemname
pkgver=0.6.3
pkgrel=1
pkgdesc="Run Minitest suites as Chef report handlers"
arch=('any')
url="https://github.com/calavera/minitest-chef-handler"
license=('MIT')
depends=(
  'ruby'
  'ruby-chef'
  'ruby-ci_reporter'
  'ruby-minitest'
  'ruby-rake'
)
makedepends=('rubygems')
source=(http://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('854444006838c82dddf36e14d37bb1dd')
sha1sums=('f89d9515e04798a3a15f03f1a4a28f5635c649db')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
