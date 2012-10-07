# Maintainer:  Hyacinthe Cartiaux <hyacinthe.cartiaux (a) free.fr>

pkgname=ruby-jruby-pageant
pkgver=1.1.1
_realname="jruby-pageant"
pkgrel=1
pkgdesc="This is a convenience gem packaging required JNA/JSCH jars."
arch=(any)
url="https://rubygems.org/gems/jruby-pageant"
license=("Creative-Commons-BY")
depends=('ruby')
source=(http://gems.rubyforge.org/gems/$_realname-$pkgver.gem)
md5sums=('06f62033858d27f984edba13e792b4c0')
noextract=($_realname-$pkgver.gem)

build() {
  cd $srcdir
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir$_gemdir" ${_realname}-$pkgver.gem
}
