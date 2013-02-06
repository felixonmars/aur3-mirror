# Contributor: Srijan Choudhary <srijan4@gmail.com>
pkgname=ruby-jekyll_ext
_gemname=${pkgname#ruby-}
pkgver=0.1.4
pkgrel=1
pkgdesc="Allows you to extend the Jekyll static blog generator"
arch=(any)
url="http://rfelix.com/2010/01/19/jekyll-extensions-minus-equal-pain/"
license=('unknown')
depends=('ruby'
         'ruby-jekyll')
makedepends=('rubygems')
source=("http://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
md5sums=('2284e1704a0ef93a5154d292d13be86b')

build() {
  cd "${srcdir}"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "${pkgdir}${_gemdir}" "${_gemname}-${pkgver}.gem" -n "${pkgdir}/usr/bin"
}
