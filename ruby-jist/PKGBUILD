# Maintainer: OmeGa <omega at mailoo dot org>
# Contributor: Gen2ly <toddrpartridge@gmail.com>

pkgname=ruby-jist
_gemname=jist
pkgver=1.4.0
pkgrel=1
pkgdesc="A command-line utility for uploading gists."
arch=('any')
url="https://github.com/ConradIrwin/jist"
license=('MIT')
depends=('ruby' 'ruby-json')
makedepends=('rubygems')
source=(http://rubygems.org/downloads/$_gemname-$pkgver.gem
        LICENSE)
noextract=($_gemname-$pkgver.gem)
sha1sums=('5d25110721e1e863f2942226be54cb924ee9d8f9'
          '30a6c26d5605a19562b52903a129554db4637f03')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" \
    -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
