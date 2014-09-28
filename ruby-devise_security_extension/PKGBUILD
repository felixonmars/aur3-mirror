# Maintainer: Alireza Savand <alireza.savand@gmail.com>

_gemname=devise_security_extension
pkgname=ruby-$_gemname
pkgver=0.8.0
pkgrel=1
pkgdesc='Security extension for devise'
arch=(any)
url='http://github.com/phatworx/devise_security_extension'
license=(MIT)
depends=(ruby ruby-rails ruby-devise)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('d03e2347b48b47dc29258e5bb8a51a63904d6431')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
