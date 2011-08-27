pkgname=ruby-openid
pkgver=2.1.7
pkgrel=1
pkgdesc="OpenID support for Ruby"
arch=(any)
url="http://openid.rubyforge.org/"
license=("GPL")
depends=('ruby')
source=(http://gems.rubyforge.org/gems/$pkgname-$pkgver.gem)
noextract=($pkgname-$pkgver.gem)

build() {
  cd $srcdir
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies -i "$pkgdir$_gemdir" ${pkgname}-$pkgver.gem
}
md5sums=('628aabab4f5d01f0b8ca69e6cf977d3d')
