# Maintainer: Alireza Savand <alireza.savand@gmail.com>

_gemname=devise_oauth2_providable
pkgname=ruby-$_gemname
pkgver=1.1.2
pkgrel=1
pkgdesc='OAuth2 Provider for Rails3 applications'
arch=(any)
url='https://rubygems.org/gems/devise_oauth2_providable'
license=()
depends=(ruby ruby-rails ruby-devise ruby-rack-oauth2)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('15499b7a70c12b79d8dddfd0e94b10fedbb74418')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
