# Maintainer: Alireza Savand <alireza.savand@gmail.com>

_gemname=main
pkgname=ruby-$_gemname
pkgver=6.0.0
pkgrel=1
pkgdesc='main'
arch=(any)
url='https://github.com/ahoward/main'
license=()
depends=(ruby ruby-chronic ruby-fattr ruby-arrayfields ruby-map)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('74660f13f22fd61b7150ffbb9afaad78ec46444f')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
