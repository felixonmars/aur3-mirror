# Contributor: Guilherme "nirev" Nogueira <guilherme@nirev.org>
# vim:set ts=2 sw=2 et:
_gemname=mutter
pkgname=ruby-${_gemname}
pkgver=0.5.3
pkgrel=2
pkgdesc="ruby gem; Tiny command-line interface with lots of style."
arch=(any)
url="http://github.com/cloudhead/mutter"
license=('MIT')
depends=('ruby' 'ruby-hoe')
makedepends=('rubygems')
source=("http://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-$pkgver.gem")

build() {
  cd $srcdir
  export HOME=/tmp
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install  --no-user-install --ignore-dependencies -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-$pkgver.gem
}
md5sums=('11acb53403e2fb2755e0ac4270b3f98b')
