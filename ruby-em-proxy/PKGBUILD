# Contributor: Wes Brown <wesbrown18@gmail.com>
pkgname=ruby-em-proxy
pkgver=0.1.6
_realname="em-proxy"
pkgrel=1
pkgdesc="Ruby Event Machine Proxy Library"
arch=(any)
url="https://github.com/igrigorik/em-proxy"
license=("GPL")
depends=('ruby' 'ruby-eventmachine')
source=(http://rubygems.org/downloads/em-proxy-${pkgver}.gem)
noextract=(em-proxy-${pkgver}.gem)

build() {
  cd $srcdir
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies -i "$pkgdir$_gemdir" ${_realname}-${pkgver}.gem
}
md5sums=('b2d28f9fd57b215b86583363c766e8f9')
