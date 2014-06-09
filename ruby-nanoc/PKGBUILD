# Maintainer: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
# Contributor: Lucky <archlinux@builds.lucky.li>
#
# namcap warns that ruby-cri is an unnecessary dependency. This is untrue.

pkgname=ruby-nanoc
_gemname="${pkgname#ruby-}"
pkgver=3.7.0
pkgrel=1
pkgdesc='A simple, flexible static site generator written in Ruby.'
arch=(any)
url='http://nanoc.ws'
license=(MIT)
depends=(ruby-cri)
makedepends=(rubygems)
optdepends=(
    "ruby-adsf: Provides 'nanoc view' command."
    "ruby-listen: Provides 'nanoc watch' command."
    "ruby-nokogiri: Provides 'nanoc check' command."
    "ruby-w3c_validators: Provides 'nanoc check' command."
)
provides=(ruby-nanoc3)
conflicts=(ruby-nanoc3)
options=(!emptydirs)
source=("http://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
sha256sums=('d4566c03737cecb5f8c9c543166e3e7c65676f72582d3c6cfc0f4c263bca439e')

package() {
  # install gem
  HOME=/tmp gem install \
    --no-user-install \
    --ignore-dependencies \
    --install-dir "${pkgdir}$(ruby -rubygems -e 'puts Gem.default_dir')" \
    --bindir "${pkgdir}/usr/bin" \
    "${srcdir}/${_gemname}-${pkgver}.gem"

  # install license
  install -Dm 644 \
    "${pkgdir}"/usr/lib/ruby/gems/*/gems/"${_gemname}-${pkgver}"/LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
