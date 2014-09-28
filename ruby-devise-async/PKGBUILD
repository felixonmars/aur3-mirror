# Maintainer: Alireza Savand <alireza.savand@gmail.com>

_gemname=devise-async
pkgname=ruby-$_gemname
pkgver=0.9.0
pkgrel=1
pkgdesc='Devise Async provides an easy way to configure Devise to send its emails asynchronously using your preferred queuing backend. It supports Resque, Sidekiq, Delayed::Job and QueueClassic.'
arch=(any)
url='https://github.com/mhfs/devise-async/'
license=()
depends=(ruby ruby-devise)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('594c07debf1f35f0847bc6e67a1f84974c98a3f4')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
