# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Brice Waegeneire <brice dot wge at gmail dot com>
# Contributor: Anshuman Bhaduri <anshuman (dot) bhaduri 0 (at) gmail (dot) com>

_gemname=fission
pkgname=ruby-$_gemname-0.4.0
pkgver=0.4.0
pkgrel=1
pkgdesc="A simple utility to manage VMware Fusion VMs from the command line."
arch=('any')
url="https://github.com/thbishop/fission/"
license=('MIT')
depends=('ruby' 'ruby-cfpropertylist-2.0')
provides=('ruby-cfpropertylist')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
sha512sums=('2cb55ed8dd6b214a331d0633c9dde7b6d56e464bffcae8c08315b0c9160cf5914b8a05defef100d783404aa9230944a480e2fa0463fc2e69d95169c4b4ad799d')
noextract=(${_gemname}-${pkgver}.gem)

package() {
  cd "${srcdir}"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies \
    -i "${pkgdir}${_gemdir}" ${_gemname}-${pkgver}.gem

  install -Dm644 $(find "${pkgdir}" -name LICENSE) \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
