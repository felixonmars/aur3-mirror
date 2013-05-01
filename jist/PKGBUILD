# Maintainer: OmeGa <omega at mailoo dot org>

pkgname=jist
pkgver=1.5.1
pkgrel=1
pkgdesc="A command-line utility for uploading gists."
arch=('any')
url="https://github.com/ConradIrwin/jist"
license=('MIT')
depends=('ruby' 'ruby-json')
makedepends=('rubygems')
source=(http://rubygems.org/downloads/$pkgname-$pkgver.gem
        LICENSE)
noextract=($pkgname-$pkgver.gem)
sha1sums=('fa37c5f164cd9165913fedcf77b9cc02eb3a0232'
          '30a6c26d5605a19562b52903a129554db4637f03')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" \
    -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
