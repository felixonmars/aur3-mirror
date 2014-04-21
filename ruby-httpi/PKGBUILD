# Maintainer: Jochen Schalanda <jochen+aur@schalanda.name>
_gemname=httpi
pkgname=ruby-$_gemname
pkgver=2.1.0
pkgrel=1
pkgdesc="Common interface for Ruby's HTTP libraries"
arch=(any)
url='https://github.com/savonrb/httpi'
license=('MIT')
depends=('ruby' 'ruby-rack')
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
sha256sums=('bdfd16c619d376aff26a4f4ed2a3dfafb1bcbf43d6713539106529b7fe03fb0a')
