# Maintainer: Alireza Savand <alireza.savand@gmail.com>

_gemname=diaspora-vines
pkgname=ruby-$_gemname
pkgver=0.1.22
pkgrel=1
pkgdesc='Diaspora-vines is a Vines fork build for diaspora integration.'
arch=(any)
url='https://diasporafoundation.org'
license=(MIT)
depends=(ruby ruby-bcrypt ruby-em-hiredis-0.1 ruby-eventmachine ruby-http_parser.rb ruby-net-ldap ruby-nokogiri ruby-activerecord)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('8f32c7c99e090bbcb05911adac282b586ede1e1a')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
