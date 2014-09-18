# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Brice Waegeneire <brice dot wge at gmail dot com>
# Contributor: Anshuman Bhaduri <anshuman (dot) bhaduri 0 (at) gmail (dot) com>

_gemname=fission
pkgname=ruby-$_gemname
pkgver=0.5.0
pkgrel=1
pkgdesc="A simple utility to manage VMware Fusion VMs from the command line."
arch=('any')
url="https://github.com/thbishop/fission/"
license=('MIT')
depends=('ruby' 'ruby-cfpropertylist')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
sha512sums=('7306bf076fcc5265b05b517e2eb8ca32e4038f99ee6c4d83b4ebf7374dd6ad5b07182f3fc690db964720df0041641e458c549ae30fc4f2ca17a4837629db3cbb')
noextract=(${_gemname}-${pkgver}.gem)

package() {
  cd "${srcdir}"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies \
    -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem

  install -Dm644 $(find "${pkgdir}" -name LICENSE) \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
