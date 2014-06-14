# Maintainer: Jochen Schalanda <jochen+aur@schalanda.name>
_gemname=puppet_forge
pkgname=ruby-$_gemname
pkgver=1.0.1
pkgrel=1
pkgdesc='Access and manipulate the Puppet Forge API from Ruby.'
arch=(any)
url='https://github.com/puppetlabs/forge-ruby'
license=('Apache')
depends=('ruby' 'ruby-her>=0.6')
noextract=($_gemname-$pkgver.gem)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha256sums=('20fce896e4911cda72fee1e05467eff9a50712b80e565c60f37ce04a2a111013')

package() {
  cd "${srcdir}"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "${pkgdir}${_gemdir}" \
    -n "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"
}

# vim:set ts=2 sw=2 et:
