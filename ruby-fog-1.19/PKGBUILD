# Maintainer: Bertrand Bonnefoy-Claudet <bertrandbc@gmail.com>

_gemname=fog
pkgname=ruby-$_gemname-1.19
pkgver=1.19.0
pkgrel=1
pkgdesc="Brings clouds to you"
arch=('any')
url="http://github.com/fog/fog"
license=('MIT')
depends=(
  'ruby'
  'ruby-builder>=0'
  'ruby-excon>=0.31.0'
  'ruby-formatador>=0.2.0'
  'ruby-mime-types>=0'
  'ruby-multi_json>=1.0'
  'ruby-net-scp>=1.1'
  'ruby-net-ssh>=2.1.3'
  'ruby-nokogiri>=1.5.0'
  'ruby-hmac>=0')
makedepends=('rubygems')
conflicts=('ruby-fog')
source=(http://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('3f635554c4889d88fae9e80488472ab4')


package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir$_gemdir" $_gemname-$pkgver.gem
}

