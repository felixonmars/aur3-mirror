# Maintainer: Alireza Savand <alireza.savand@gmail.com>

_gemname=opal
pkgname=ruby-$_gemname
pkgver=0.6.2
pkgrel=1
pkgdesc='Ruby runtime and core library for javascript'
arch=(any)
url='http://opalrb.org'
license=(MIT)
depends=(ruby ruby-source_map ruby-sprockets)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('e6d4073b483a5a14a9d0b2a276126a1354642bf4')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
