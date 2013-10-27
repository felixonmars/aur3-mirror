# Maintainer: Jochen Schalanda <jochen+aur@schalanda.name>
# Contributor: eagletmt <eagletmt@gmail.com>
__gemname=addressable
pkgname=ruby-$_gemname
pkgver=2.3.5
pkgrel=1
pkgdesc='URI Implementation'
arch=('any')
url='http://addressable.rubyforge.org/'
license=('MIT')
depends=('ruby')
makedepends=('rubygems')
source=("https://rubygems.org/downloads/$__gemname-$pkgver.gem")
noextract=($__gemname-$pkgver.gem)
md5sums=('6b9a61885c3c95f912eec560f8f2e3eb')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e 'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" $__gemname-$pkgver.gem
}

# vim:set ts=2 sw=2 et:
