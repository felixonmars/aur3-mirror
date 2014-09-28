# Maintainer: Alireza Savand <alireza.savand@gmail.com>

_gemname=devise_ldap_authenticatable
pkgname=ruby-$_gemname
pkgver=0.8.1
pkgrel=1
pkgdesc='Devise extension to allow authentication via LDAP'
arch=(any)
url='https://github.com/cschiewek/devise_ldap_authenticatable'
license=(MIT)
depends=(ruby ruby-devise ruby-net-ldap-0.5)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('b51435ae85add08a5d8894db511824e65b4fd5dc')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/MIT-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/MIT-LICENSE"
}
