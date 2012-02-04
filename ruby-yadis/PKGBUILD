pkgname=ruby-yadis
pkgver=0.3.4
pkgrel=1
pkgdesc="A library for performing Yadis service discovery"
arch=(any)
url="http://www.openidenabled.com/yadis/libraries/ruby"
license=("GPL")
depends=('ruby')
source=(http://gems.rubyforge.org/gems/$pkgname-$pkgver.gem)
noextract=($pkgname-$pkgver.gem)

build() {
  cd $srcdir
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies -i "$pkgdir$_gemdir" ${pkgname}-$pkgver.gem
}
md5sums=('2d011bbc171992ced63e566b9891c38f')
