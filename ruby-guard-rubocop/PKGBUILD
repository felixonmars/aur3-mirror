# Maintainer: Alireza Savand <alireza.savand@gmail.com>

_gemname=guard-rubocop
pkgname=ruby-$_gemname
pkgver=1.1.0
pkgrel=1
pkgdesc='Guard plugin for RuboCop'
arch=(any)
url='https://github.com/yujinakayama/guard-rubocop'
license=(MIT)
depends=(ruby ruby-guard ruby-rubocop)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('658fd0734c209e453d23c7785a8d59d8a84613bd')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
