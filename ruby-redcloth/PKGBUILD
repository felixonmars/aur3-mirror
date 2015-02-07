# Maintainer: lolilolicon <lolilolicon[at]gmail.com>
# Contributor: oliparcol <oliparcol[at]gmail.com>

pkgname=ruby-redcloth
_gemname=RedCloth
pkgver=4.2.9
pkgrel=3
pkgdesc="Module for using the Textile markup language in Ruby."
arch=(i686 x86_64)
url="http://redcloth.org/"
license=('MIT')
depends=('ruby')
source=(http://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=("$_gemname-$pkgver.gem")
md5sums=('021dc588a1f5ec5804c0083c09740b39')

package() {
  local _gemdir=$(ruby -rubygems -e'puts Gem.default_dir')
  gem install --ignore-dependencies --no-user-install --verbose \
    -i "$pkgdir$_gemdir" -n "$pkgdir"/usr/bin "$_gemname-$pkgver.gem"
}
