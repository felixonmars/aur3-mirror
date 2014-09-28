# Maintainer: Alireza Savand <alireza.savand@gmail.com>

_gemname=rubocop-checkstyle_formatter
pkgname=ruby-$_gemname
pkgver=0.1.1
pkgrel=1
pkgdesc='A formatter for rubocop that outputs in checkstyle format'
arch=(any)
url='https://github.com/eitoball/rubocop-checkstyle_formatter'
license=(MIT)
depends=(ruby ruby-rubocop)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('82dc93676538953a4e6830583bb63ea2b8c6db59')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
