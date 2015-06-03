# Maintainer: Ralph Amissah <ralph.amissah@gmail.com>
# sisu-git-gem
_pkgname=sisu
_gemname=${_pkgname}
pkgname=("${_pkgname}-git-gem")
pkgdesc="documents - structuring, publishing in multiple formats & search"
pkgver=7.1.5.r0.gf3a5e91
pkgver() {
  cd "${srcdir}/${pkgname}"
  echo $(git describe --long --tags | sed 's/^[ a-z_-]\+\([0-9.]\+\)/\1/;s/\([^-]*-g\)/r\1/;s/-/./g')
}
pkgrel=1
source=("${pkgname}::git://git.sisudoc.org/git/code/sisu.git#branch=upstream")
md5sums=('SKIP')
noextract=("${pkgname}-${pkgver}.gem")
arch=('any')
url="http://sisudoc.org"
license=('GPL3')
depends=('ruby')
makedepends=('git' 'ruby' 'ruby-thor')
optdepends=(
  'zip: epub & odf:odt files'
  'unzip: epub & odf:odt files (not required)'
  'tree: report directory structure'
  'imagemagick: image support'
  'graphicsmagick: image support'
  'texlive-core: pdf'
  'texlive-latexextra: pdf'
  'texlive-fontsextra: pdf'
  'texlive-langcjk: pdf Chinese Japanese Korean (large optional dependency, comment out if not needed)'
  'sqlite: search, populate sqlite db'
  'ruby-sqlite3: search, populate sqlite db'
  'postgresql: search, populate postgresql db'
  'ruby-pg: search, populate postresql db'
  'ruby-fcgi: search, sample search form'
  'qrencode: qrcodes based on document metadata'
  )
conflicts=('sisu' 'sisu-gem' 'sisu-git')
options=(!emptydirs)
package() {
  msg "Creating gem from git source ..."
  cd "${srcdir}/${pkgname}"
  qi gem --create --build --git-version-number
  msg "Creating arch package from gem ..."
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  msg "gem name: ${_gemname}-${pkgver}.gem"
  gem install --ignore-dependencies --no-user-install --no-document -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"
}
