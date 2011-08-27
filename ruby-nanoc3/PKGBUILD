# Maintainer:   Lucky <aur.archlinux.org [at] lucky.take0ver [dot] net>

pkgname=ruby-nanoc3
_pkgname="${pkgname#ruby-}"
pkgver=3.2.0
pkgrel=1
pkgdesc="A web publishing system written in Ruby for building small to medium-sized websites."
url="http://nanoc.stoneship.org"
arch=("any")
license=("MIT")
depends=("ruby" "ruby-cri")
source=("http://gems.rubyforge.org/gems/${_pkgname}-${pkgver}.gem")
noextract=("${_pkgname}-${pkgver}.gem")
md5sums=("dd60a61ea383a57c18e446c8f66b49df")
sha1sums=("50743614fa3bcec09c2b3b496321c0d6f6bb4721")

package() {
  cd "${srcdir}"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies -i "${pkgdir}${_gemdir}" "${_pkgname}-${pkgver}.gem" \
  -n "${pkgdir}/usr/bin"
}
