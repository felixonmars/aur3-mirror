# Maintainer: Guten Ye

_gemname=girl_friday
pkgname=ruby-$_gemname
pkgver=0.11.2
pkgrel=1
pkgdesc="Background processing, simplified"
arch=('any')
url="http://github.com/mperham/girl_friday"
license=('unknown')
depends=('ruby' 'ruby-connection_pool')
makedepends=('rubygems')
source=(http://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir$_gemdir" $_gemname-$pkgver.gem
}

md5sums=('a70bb0649250405360b2f136bf0e90b4')
