# Maintainer: Jochen Schalanda <jochen+aur@schalanda.name>
_gemname=wasabi
pkgname=ruby-$_gemname
pkgver=3.2.2
pkgrel=1
pkgdesc='A simple WSDL parser for Ruby'
arch=(any)
url='https://github.com/savonrb/wasabi'
license=('MIT')
depends=('ruby' 'ruby-httpi>=2.0' 'ruby-nokogiri>=1.4.0' 'ruby-mime-types-1')
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
sha256sums=('fdb8ae57568c6331be828a12d61a1e9728b6943b576240601b476ca9fb8a6fb6')
