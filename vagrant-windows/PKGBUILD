# Maintainer: Max Meyer <dev@fedux.org>
_gemname=vagrant-windows
pkgname=vagrant-windows
pkgver=1.3.0
pkgrel=2
pkgdesc="Addon for vagrant to support usage of windows guests"
arch=(any)
url="https://github.com/WinRb/vagrant-windows"
license=('Apache')
depends=('ruby-vagrant')
makedepends=('rubygems')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
sha256sums=('5c9ec513a9f82b8c02c024fdb9db5f0099bcbf92d5bfb242dcaa4b3238fd5e78')

package() {
  cd "${srcdir}"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "${pkgdir}${_gemdir}" -n "$pkgdir/usr/bin" \
    "${_gemname}-${pkgver}.gem"
}
