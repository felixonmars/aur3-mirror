# Maintainer: Alireza Savand <alireza.savand@gmail.com>

_gemname=rack-oauth2
pkgname=ruby-$_gemname
pkgver=0.11.0
pkgrel=1
pkgdesc='OAuth 2.0 Server & Client Library - Both Bearer and MAC token type are supported'
arch=(any)
url='http://github.com/nov/rack-oauth2'
license=()
depends=(ruby ruby-rack ruby-json ruby-httpclient ruby-activesupport ruby-i18n ruby-attr_required)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('1db5dcc31011e6ee4afe60e425ac1b8fd0b959a4')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
