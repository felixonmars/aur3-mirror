# Maintainer: Alireza Savand <alireza.savand@gmail.com>

_gemname=yui-compressor
pkgname=ruby-$_gemname
pkgver=0.12.0
pkgrel=1
pkgdesc='JavaScript and CSS minification library'
arch=(any)
url='http://github.com/sstephenson/ruby-yui-compressor/'
license=(MIT BSD-3-clause MPL)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('734d5fdf225bd8932d1e82d8a6f2ac3d851e6443')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
