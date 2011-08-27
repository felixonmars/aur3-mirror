# Contributor: gem2arch 0.1
pkgname=ruby-gemcutter
pkgver=0.6.1
_realname="gemcutter"
pkgrel=1
pkgdesc="Commands to interact with gemcutter.org"
arch=(any)
url="http://gemcutter.org"
license=("GPL")
depends=('ruby')
md5sums=('3e57aabfd7506040b8562440aca5a805')

source=(http://gems.rubyforge.org/gems/gemcutter-$pkgver.gem)
noextract=(gemcutter-$pkgver.gem)

build() {
  cd $srcdir
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies -i "$pkgdir$_gemdir" ${_realname}-$pkgver.gem
}
