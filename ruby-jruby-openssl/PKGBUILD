# Maintainer: Chris Fordham <chris at fordham-nagy dot id dot au> aka flaccid
# Package Source: https://github.com/flaccid/archlinux-packages/blob/master/ruby-jruby-openssl/PKGBUILD

pkgname=ruby-jruby-openssl
_gemname=jruby-openssl
pkgver=0.9.4
pkgrel=1
pkgdesc="JRuby-OpenSSL is an add-on gem for JRuby that emulates the Ruby OpenSSL native library."
arch=(any)
url="https://github.com/jruby/jruby-ossl"
license=('GPL2')
depends=('ruby' 'git')
makedepends=('rubygems')
source=(http://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('71660753f30411245a761a89315c29dc')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e 'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" $_gemname-$pkgver.gem
}

# vim:set ts=2 sw=2 et:
