# Maintainer: Alireza Savand <alireza.savand@gmail.com>

_gemname=dependency_injector
pkgname=ruby-$_gemname
pkgver=0.0.1
pkgrel=1
pkgdesc='Simple dependency injector'
arch=(any)
url='https://rubygems.org/gems/dependency_injector'
license=()
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('cb0d204dea9cb8bd738e916ca36bb4b4874749d9')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
