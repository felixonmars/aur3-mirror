# $Id$
# Maintainer: Chris Fordham <chris at fordham-nagy dot id dot au> aka flaccid
# Package Source: https://github.com/flaccid/archlinux-packages/blob/master/ruby-right_link/PKGBUILD

pkgname=ruby-right_link
_gemname=right_link
pkgver=5.9.5
pkgrel=1
pkgdesc="A daemon that connects systems to the RightScale cloud management platform."
arch=(any)
url="https://github.com/rightscale/right_link"
license=('custom:RightLink')
depends=('ruby')
makedepends=('rubygems')
source=(http://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('a7cbe824f57e9486d62bd73695f935a8')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e 'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" $_gemname-$pkgver.gem
}

# vim:set ts=2 sw=2 et: