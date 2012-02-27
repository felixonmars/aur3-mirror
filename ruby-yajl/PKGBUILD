# Contributor: lolilolicon <lolilolicon#gmail.com>

pkgname=ruby-yajl
_pkgname=yajl-ruby
pkgver=1.1.0
pkgrel=2
pkgdesc="Ruby C bindings to the excellent Yajl JSON stream-based parser library"
arch=(i686 x86_64)
url="http://github.com/brianmario/yajl-ruby"
license=('MIT')
depends=('ruby')
source=(http://rubygems.org/downloads/$_pkgname-$pkgver.gem)
noextract=("$_pkgname-$pkgver.gem")
md5sums=('5f35141b89be7da3b279b65ea0f3c0c2')

package() {
  cd "$srcdir"
  local _gemdir=$(ruby -rubygems -e'puts Gem.default_dir')
  gem install --ignore-dependencies --no-user-install \
    -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_pkgname-$pkgver.gem"
}
