pkgname=ruby1.8-openid
pkgver=2.1.7
pkgrel=1
pkgdesc="OpenID support for Ruby"
arch=(any)
url="http://openid.rubyforge.org/"
license=("GPL")
depends=('ruby1.8')
source=(http://gems.rubyforge.org/gems/ruby-openid-$pkgver.gem)
noextract=(ruby-openid-$pkgver.gem)

build() {
  cd $srcdir
  local _gemdir="$(ruby-1.8 -rubygems -e'puts Gem.default_dir')"
  gem-1.8 install --ignore-dependencies -i "$pkgdir$_gemdir" ruby-openid-$pkgver.gem
}
md5sums=('628aabab4f5d01f0b8ca69e6cf977d3d')
