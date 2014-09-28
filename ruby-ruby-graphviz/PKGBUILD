# Maintainer: Alireza Savand <alireza.savand@gmail.com>

_gemname=ruby-graphviz
pkgname=ruby-$_gemname
pkgver=1.2.1
pkgrel=1
pkgdesc='Interface to the GraphViz graphing tool'
arch=(any)
url='http://github.com/glejeune/Ruby-Graphviz'
license=()
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('885b6cd99ec181ceb20160182eb24451c1eb176b')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/COPYING.rdoc" "$pkgdir/usr/share/licenses/$pkgname/COPYING.rdoc"
}
