# Maintainer: Alireza Savand <alireza.savand@gmail.com>

_gemname=volt
pkgname=ruby-$_gemname
pkgver=0.7.22
pkgrel=1
pkgdesc='A ruby web framework where your ruby runs on both server and client (via Opal)'
arch=(any)
url='http://voltframework.com'
license=(MIT)
depends=(ruby ruby-thor ruby-pry ruby-rack ruby-sprockets-sass ruby-sass ruby-mongo ruby-listen ruby-uglifier ruby-yui-compressor ruby-opal ruby-opal-jquery ruby-rspec-core ruby-rspec-expectations ruby-capybara ruby-selenium-webdriver ruby-chromedriver2-helper ruby-poltergeist ruby-opal-rspec)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('461f5f0aea1ae8b14423331b2483554211b4007b')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
