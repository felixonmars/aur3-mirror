# Maintainer: Volkov Igor <gg0sha@ya.ru>

_gemname=rails-dom-testing
pkgname=ruby-$_gemname
pkgver=1.0.6
pkgrel=1
pkgdesc='This gem can compare doms and assert certain elements exists in doms using Nokogiri.'
arch=(any)
url='https://github.com/kaspth/rails-dom-testing'
license=(MIT)
depends=(ruby ruby-nokogiri ruby-activesupport ruby-rails-deprecated_sanitizer)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('f7b0d08b8a299db0dc5d2e2500ba8707244a8f21')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
