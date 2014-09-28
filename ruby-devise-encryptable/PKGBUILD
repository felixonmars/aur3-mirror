# Maintainer: Alireza Savand <alireza.savand@gmail.com>

_gemname=devise-encryptable
pkgname=ruby-$_gemname
pkgver=0.2.0
pkgrel=1
pkgdesc='Encryption solution for salted-encryptors on Devise'
arch=(any)
url='http://github.com/plataformatec/devise-encryptable'
license=('Apache 2.0')
depends=(ruby ruby-devise)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('0c0cda182d5b1841b2a2e287ac1ae25be95540f0')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
