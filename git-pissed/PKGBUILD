# Maintainer: Felix Yan <felixonmars@gmail.com>

_gemname=git_pissed
pkgname=git-pissed
pkgver=1.0.5
pkgrel=1
arch=('x86_64' 'i686')
pkgdesc='Gitting pissed about your code'
url='https://github.com/chrishunt/git-pissed'
license=('MIT')
depends=('ruby')
makedepends=('rubygems')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=($_gemname-$pkgver.gem)

package() {
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" \
    -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
sha256sums=('ab6bd9eea3a9eee13eeedc233ff6aeaff31380098df6f7b1c21496c01f7a6d73')
