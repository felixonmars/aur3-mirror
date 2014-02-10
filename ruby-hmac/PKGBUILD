# Maintainer: Jochen Schalanda <jochen+aur@schalanda.name>
pkgname=ruby-hmac
pkgver=0.4.0
pkgrel=4
pkgdesc='Provides common interface to HMAC functionality'
arch=(any)
url='http://ruby-hmac.rubyforge.org/'
license=('MIT')
depends=('ruby')
source=(https://rubygems.org/downloads/$pkgname-$pkgver.gem)
md5sums=('aeb575f12bd75af1efa24eee528a4fc0')
noextract=($pkgname-$pkgver.gem)

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" \
    -n "$pkgdir/usr/bin" "$pkgname-$pkgver.gem"
}
