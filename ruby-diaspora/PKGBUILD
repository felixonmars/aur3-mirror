# Maintainer: Alireza Savand <alireza.savand@gmail.com>

_gemname=diaspora
pkgname=ruby-$_gemname
pkgver=0.0.1
pkgrel=1
pkgdesc='Goal the first: Get this gem to set up a diaspora instance and get it running. Goal the rest: Figure out what else it should do.'
arch=(any)
url='http://github.com/Spaceghost/diaspora'
license=()
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('c0e2d783e75c28dbcd5e5d819d2665b070646cff')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
