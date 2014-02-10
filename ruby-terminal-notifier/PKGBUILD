# Maintainer: Jochen Schalanda <jochen+aur@schalanda.name>
_gemname=terminal-notifier
pkgname=ruby-$_gemname
pkgver=1.5.1
pkgrel=1
pkgdesc='Send User Notifications on Mac OS X 10.8 or higher.'
arch=('any')
url='https://github.com/alloy/terminal-notifier'
license=('MIT')
depends=(
  'ruby'
  'ruby-bacon'
  'ruby-mocha'
  'ruby-mocha-on-bacon')
source=(http://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
md5sums=('f940366ac0e7825f1052fac14e216b6a')
