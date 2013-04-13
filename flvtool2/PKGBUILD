# Maintainer: Alexsandr Pavlov <kidoz at mail dot ru>
# Contributor: Aaron Bishop <erroneous@gmail.com>
pkgname=flvtool2
pkgver=1.0.6
pkgrel=5
pkgdesc="Manipulation tool for Macromedia Flash Video files (FLV)."
arch=('i686' 'x86_64')
url="https://github.com/unnu/flvtool2"
license=('GPL')
depends=('ruby1.8' 'rubygems1.8')
source=(http://gems.rubyforge.org/gems/$pkgname-$pkgver.gem)
noextract=($pkgname-$pkgver.gem)
sha256sums=('129313cfd8c43cf14431c74bbc20cb17328cf4d27c2f39a0cf24de6040505477')

package() {
  cd "${srcdir}"
  
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  HOME=/tmp gem install --no-user-install --ignore-dependencies \
  -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" \
  ${_gemname}-${pkgver}.gem
}
