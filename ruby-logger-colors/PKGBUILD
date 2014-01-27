# Maintainer: Andrwe Lord Weber <lord-weber-andrwe@andrwe.org>
_gemname=logger-colors
pkgname=ruby-$_gemname
pkgver=1.0.0
pkgrel=1
pkgdesc="Colorful stdlib logger levels."
arch=('any')
url="https://gist.github.com/962344"
license=('unknown')
depends=('ruby-logger')
source=("http://gems.rubyforge.org/gems/$_gemname-${pkgver}.gem")
noextract=("$_gemname-${pkgver}.gem")
md5sums=('4d122bef8ed8c45aa072a9d2acf7741a')

package() {
  cd "${srcdir}"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" $_gemname-$pkgver.gem \
    -n "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
