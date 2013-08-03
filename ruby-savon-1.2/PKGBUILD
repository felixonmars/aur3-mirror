# Maintainer: Jochen Schalanda <jochen+aur@schalanda.name>
_gemname=savon
pkgname="ruby-${_gemname}-1.2"
pkgver=1.2.0
pkgrel=2
pkgdesc='Delicious SOAP for the Ruby community (1.x series)'
arch=(any)
url='http://savonrb.com/'
license=('MIT')
depends=(
	'ruby' 'ruby-nori-1.1' 'ruby-httpi-1.1' 'ruby-wasabi-2.5'
	'ruby-akami>=1.2.0' 'ruby-gyoku-0.4' 'ruby-builder>=2.1.2'
	'ruby-nokogiri>=1.4.0')
makedepends=('rubygems')
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
md5sums=('a8a729e562d145ec637e03b2bbf6fd58')
