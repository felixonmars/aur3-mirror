# Maintainer: Alireza Savand <alireza.savand@gmail.com>

_gemname=dm-rails
pkgname=ruby-$_gemname
pkgver=1.2.1
pkgrel=1
pkgdesc='Use DataMapper with Rails 3'
arch=(any)
url='http://github.com/datamapper/dm-rails'
license=()
depends=(ruby ruby-dm-core ruby-dm-active_model ruby-actionpack-3 ruby-railties-3)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('220268e3f9292ed1db02104214c9eb7268150c16')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
