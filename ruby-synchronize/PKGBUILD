# Maintainer: Andrwe Lord Weber <lord-weber-andrwe@andrwe.org>
_gemname=synchronize
pkgname=ruby-$_gemname
pkgver=0.2.0
pkgrel=1
pkgdesc="Performs synchronization of the contents between different Rails environments."
arch=('any')
url="https://github.com/bebanjo/synchronize"
license=('unknown')
depends=('ruby' 'ruby-fog>=0.10.0' 'ruby-commander>=4.0.6' 'ruby-chef>=0.10')
makedepends=('ruby')
source=("http://gems.rubyforge.org/gems/synchronize-${pkgver}.gem")
noextract=("synchronize-${pkgver}.gem")
md5sums=('c81cc16a80b33d15379a34e32b1230fc')

package() {
  cd "${srcdir}"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" $_gemname-$pkgver.gem \
    -n "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
