# Maintainer: Alireza Savand <alireza.savand@gmail.com>

_gemname=devise-i18n
pkgname=ruby-$_gemname
pkgver=0.11.1
pkgrel=1
pkgdesc='Translations for the devise gem'
arch=(any)
url='http://github.com/tigrish/devise-i18n'
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('5d26daf40a403ebb6648d078c1d2548d1086ddc9')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
