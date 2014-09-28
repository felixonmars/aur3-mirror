# Maintainer: Alireza Savand <alireza.savand@gmail.com>

_gemname=devise_invitable
pkgname=ruby-$_gemname
pkgver=1.3.6
pkgrel=1
pkgdesc='An invitation strategy for Devise'
arch=(any)
url='https://github.com/scambra/devise_invitable'
license=(MIT)
depends=(ruby ruby-actionmailer ruby-devise)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('64c33d9b7129c4fbd391686104d298eaff38a517')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
