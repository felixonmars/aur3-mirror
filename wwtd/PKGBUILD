# Maintainer: Jochen Schalanda <jochen+aur@schalanda.name>
_gemname=wwtd
pkgname=wwtd
pkgver=0.5.5
pkgrel=1
pkgdesc='Travis simulator so you do not need to wait for the build'
arch=(any)
url='https://github.com/grosser/wwtd'
license=('MIT')
depends=('ruby')
noextract=($_gemname-$pkgver.gem)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha256sums=('861c20538688f61be0eeb9962d35be78ff6aecb26022613702f838670e17a1e2')

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" \
    -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
