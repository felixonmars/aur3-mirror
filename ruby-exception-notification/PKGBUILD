# Maintainer: Nathan Phillip Brink <binki@gentoo.org>
pkgname=ruby-exception-notification
_gemname=${pkgname#ruby-}
_gemname=${_gemname//-/_}
pkgver=2.6.0
pkgrel=1
pkgdesc="Exception Notifier Plugin for Rails, allowing email notifications when exceptions occur."
arch=(any)
url=https://github.com/smartinez87/exception_notification
license=(MIT)
depends=(ruby rubygems ruby-rails ruby-actionmailer ruby-sqlite3)
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
md5sums=(d95b56c2a093d0056649823d978d6685)

build() {
  cd "${srcdir}"
  export HOME=/tmp
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "${pkgdir}${_gemdir}" ${_gemname}-${pkgver}.gem
}
