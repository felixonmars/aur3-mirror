# Maintainer: Jochen Schalanda <jochen+aur@schalanda.name>
_gemname=mocha-on-bacon
pkgname=ruby-$_gemname
pkgver=0.2.2
pkgrel=1
pkgdesc='A Mocha adapter for Bacon'
arch=('any')
url='https://github.com/alloy/mocha-on-bacon'
license=('MIT')
depends=('ruby' 'ruby-mocha>=0.13.0')
source=(http://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
md5sums=('d7111b853d9a1797c009be0e71e0b53c')
