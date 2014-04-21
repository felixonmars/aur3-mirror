# Maintainer: Jochen Schalanda <jochen+aur@schalanda.name>
_gemname=nori
pkgname=ruby-$_gemname
pkgver=2.4.0
pkgrel=1
pkgdesc='Ruby XML to Hash translator'
arch=(any)
url='https://github.com/savonrb/nori'
license=('MIT')
depends=('ruby')
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" \
    -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}
sha256sums=('6224f91d2464db904a6d35745acb5c37f4adeaa87524f4071cb7c3a51910095c')
