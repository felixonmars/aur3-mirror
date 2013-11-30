# Maintainer: Alfredo Palhares <masterkorp@masterkorp.net>
# Contributor: Jochen Schalanda <jochen+aur@schalanda.name>

_gemname=nori
pkgname=ruby-$_gemname-1.0
pkgver=1.0.0
pkgrel=1
pkgdesc='Ruby XML to Hash translator - Specific version for ruby-savon-0.9.5'
arch=(any)
url='https://github.com/savonrb/nori'
license=('MIT')
depends=('ruby')
makedepends=('rubygems')
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('c2a00f3771584d0ce1d127f45c770cdf')

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" \
    -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}
