# Maintainer: Jochen Schalanda <jochen+aur@schalanda.name>
_gemname=fpm-cookery
pkgname=ruby-$_gemname
pkgver=0.20.1
pkgrel=1
pkgdesc='A tool for building software packages with fpm.'
arch=(any)
url='https://github.com/bernd/fpm-cookery'
license=('MIT')
depends=(
  'ruby'
  'ruby-fpm'
  'ruby-facter'
  'puppet'
  'ruby-addressable'
  'ruby-systemu')
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('e6c4369b84d0da41276f6ead48ce6e502d6c3b649ec90f4329f0d8245191234d')

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" \
    -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}
