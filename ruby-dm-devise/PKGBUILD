# Maintainer: Alireza Savand <alireza.savand@gmail.com>

_gemname=dm-devise
pkgname=ruby-$_gemname
pkgver=2.2.1
pkgrel=1
pkgdesc='DataMapper support for devise'
arch=(any)
url='https://github.com/jm81/dm-devise'
license=()
depends=(ruby ruby-dm-core ruby-dm-migrations ruby-dm-serializer ruby-dm-timestamps ruby-dm-rails ruby-devise)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('cae01b465bf8f8a3554a9de7548bb6b90504c424')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
