# Maintainer: Jochen Schalanda <jochen+aur@schalanda.name>
_gemname=savon
pkgname="ruby-${_gemname}"
pkgver=2.4.0
pkgrel=1
pkgdesc='Heavy metal SOAP client (2.2 series)'
arch=(any)
url='http://savonrb.com/'
license=('MIT')
depends=(
	'ruby'
	'ruby-nokogiri>=1.4.0'
	'ruby-nori>=2.4.0'
	'ruby-httpi>=2.1.0'
	'ruby-wasabi>=3.2.2'
	'ruby-akami>=1.2.0'
	'ruby-gyoku'
	'ruby-builder>=2.1.2')
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
sha256sums=('65ca6e138509719953f8cc514751f9f2309c7e30d4d63d130b2550e503a7bd42')
