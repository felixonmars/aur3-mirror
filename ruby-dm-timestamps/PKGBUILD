# Maintainer: Alireza Savand <alireza.savand@gmail.com>

_gemname=dm-timestamps
pkgname=ruby-$_gemname
pkgver=1.2.0
pkgrel=1
pkgdesc='DataMapper plugin for magical timestamps'
arch=(any)
url='http://github.com/datamapper/dm-timestamps'
license=()
depends=(ruby ruby-dm-core)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('79cab768005461ec2ebebba27f505dee059702e5')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
