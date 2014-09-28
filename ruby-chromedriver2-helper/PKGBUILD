# Maintainer: Alireza Savand <alireza.savand@gmail.com>

_gemname=chromedriver2-helper
pkgname=ruby-$_gemname
pkgver=0.0.8
pkgrel=1
pkgdesc='Easy installation and use of chromedriver2, the Chromium project'\''s selenium webdriver adapter.'
arch=(any)
url='https://github.com/sztupy/chromedriver-helper'
license=()
depends=(ruby ruby-nokogiri)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('b8fa68336c44f7c60d3c01ad99aacc4d315e4b2b')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
