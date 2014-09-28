# Maintainer: Alireza Savand <alireza.savand@gmail.com>

_gemname=poltergeist
pkgname=ruby-$_gemname
pkgver=1.5.1
pkgrel=1
pkgdesc='PhantomJS driver for Capybara'
arch=(any)
url='http://github.com/jonleighton/poltergeist'
license=(MIT)
depends=(ruby ruby-capybara ruby-websocket-driver ruby-multi_json ruby-cliver)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('44cd7189ba8b4aff4c4d08726bcfcd65de4a9bb9')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
