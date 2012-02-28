# Contributor: Emiliano Vavassori <syntaxerrormmm@gmail.com>
# Maintainer: Emiliano Vavassori <syntaxerrormmm@gmail.com>
pkgname=ruby-ini
_gemname=ini
pkgver=0.1.1
pkgrel=3
pkgdesc="Makes INI file manipulation as fast, safe, and simple as possible."
arch=('any')
url="http://rubyforge.org/projects/inifile/"
license=('MIT')
depends=('ruby')
makedepends=('ruby')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem
	ini_rb_1.9.patch)
noextract=(${_gemname}-${pkgver}.gem)
md5sums=('7c18719eb491880911911ced0e6b3912'
         '8bcccd8257e396f32665ad74e13210ed')

package() {
  cd "${srcdir}"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  
  gem install --ignore-dependencies --no-user-install -f -i "${pkgdir}${_gemdir}" ${_gemname}-${pkgver}.gem

  # Fixing a syntax incompatibility with 1.9
  # See http://rubyforge.org/tracker/index.php?func=detail&aid=27484&group_id=2907&atid=11172
  cd "${pkgdir}${_gemdir}"
  patch -p0 -i "${srcdir}/ini_rb_1.9.patch"
}
