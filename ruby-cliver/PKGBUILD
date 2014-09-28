# Maintainer: Alireza Savand <alireza.savand@gmail.com>

_gemname=cliver
pkgname=ruby-$_gemname
pkgver=0.3.2
pkgrel=1
pkgdesc='Cross-platform version constraints for cli tools'
arch=(any)
url='https://www.github.com/yaauie/cliver'
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('b71032c84b9df96972ced8e27b70ecaedd21912f')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
