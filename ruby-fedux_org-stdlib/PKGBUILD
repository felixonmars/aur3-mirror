# Maintainer: Niels Martignène <niels.martignene@gmail.com>
# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>
_gemname=fedux_org-stdlib
pkgname=ruby-fedux_org-stdlib
pkgver=0.0.30
pkgrel=1
pkgdesc="Utility classes and extension to the standard library."
arch=(any)
url="http://www.fedux.org"
license=('MIT')
depends=('ruby-activesupport')
makedepends=('rubygems')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
sha256sums=('075a189517558058039df11f266a83613e85404d7ec839e72b2c089c906bdef2')

package() {
  cd "${srcdir}"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "${pkgdir}${_gemdir}" -n "$pkgdir/usr/bin" \
    "${_gemname}-${pkgver}.gem"
}
