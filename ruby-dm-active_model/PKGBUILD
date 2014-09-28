# Maintainer: Alireza Savand <alireza.savand@gmail.com>

_gemname=dm-active_model
pkgname=ruby-$_gemname
pkgver=1.2.1
pkgrel=1
pkgdesc='active_model compliance for datamapper'
arch=(any)
url='http://github.com/datamapper/dm-active_model'
license=()
depends=(ruby ruby-dm-core ruby-activemodel-3)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('6304e83056d32932fb8347bef9d0ea79079fde07')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
