# Maintainer: Jochen Schalanda <jochen+aur@schalanda.name>
_gemname=gyoku
pkgname=ruby-$_gemname
pkgver=1.2.2
pkgrel=1
pkgdesc='Gyoku converts Ruby Hashes to XML'
arch=(any)
url='https://github.com/savonrb/gyoku'
license=('MIT')
depends=('ruby' 'ruby-builder>=2.1.2')
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('b164cd019927b4106e4caa4f1071295818e82913498199dcdbbcb67eaf3d2f11')

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" \
    -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}
