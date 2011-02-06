# Contributor: Jacek Roszkowski <j.roszk@gmail.com>
pkgname=ruby1.8-gem_plugin
pkgver=0.2.3
_realname="gem_plugin"
pkgrel=1
pkgdesc="A plugin system based on rubygems that uses dependencies only"
arch=(any)
url="http://gemcutter.org/gems/gem_plugin"
license=("GPL")
depends=('ruby1.8' 'rubygems1.8')
source=(http://gems.rubyforge.org/gems/gem_plugin-$pkgver.gem)
noextract=(gem_plugin-$pkgver.gem)

build() {
  cd $srcdir
  local _gemdir="$(ruby-1.8 -rubygems -e'puts Gem.default_dir')"
  gem-1.8 install --ignore-dependencies -i "$pkgdir$_gemdir" ${_realname}-$pkgver.gem
}
md5sums=('1736ce8ce007058c4703abe2fd209aa5')
