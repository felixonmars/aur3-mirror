# Maintainer: Jochen Schalanda <jochen+aur@schalanda.name>
# Contributor: Matanya Moses <matanya@foss.co.il>
_gemname=parallel
pkgname=ruby-$_gemname
pkgver=0.9.2
pkgrel=1
pkgdesc='Run any kind of code in parallel processes'
arch=('any')
url='https://github.com/grosser/parallel'
license=('MIT')
depends=('ruby')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('4cac6768370961d334a54fe1ac31f0b6fd11e8b6')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/MIT-LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/MIT-LICENSE.txt"
}
