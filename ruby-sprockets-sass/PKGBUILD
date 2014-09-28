# Maintainer: Alireza Savand <alireza.savand@gmail.com>

_gemname=sprockets-sass
pkgname=ruby-$_gemname
pkgver=1.0.3
pkgrel=1
pkgdesc='Better Sass integration with Sprockets 2.0'
arch=(any)
url='http://github.com/petebrowne/sprockets-sass'
license=()
depends=(ruby ruby-sprockets ruby-tilt-1)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('b3b48a1b288e4273e92a8f9be32032298140f2d9')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
