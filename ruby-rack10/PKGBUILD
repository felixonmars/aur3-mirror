# Contributor: gem2arch 0.1
pkgname=ruby-rack10
pkgver=1.0.1
_realname="rack"
pkgrel=1
pkgdesc="a modular Ruby webserver interface"
arch=(any)
url="http://rack.rubyforge.org"
license=("GPL")
depends=('ruby')
provides=('ruby-rack')
source=(http://gems.rubyforge.org/gems/rack-$pkgver.gem)
noextract=(rack-$pkgver.gem)

build() {
  cd $srcdir
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies -i "$pkgdir$_gemdir" ${_realname}-$pkgver.gem
}
md5sums=('22268803c9b8b785ed30fcee5bce3ce7')
