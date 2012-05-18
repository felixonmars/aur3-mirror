# Contributor: Guilherme "nirev" Nogueira <guilherme@nirev.org>
# vim:set ts=2 sw=2 et:
pkgname=ruby-polyglot
_gemname=polyglot
pkgver=0.3.3
pkgrel=1
pkgdesc="ruby gem; Allows custom language loaders for specified file extensions to be hooked into require."
arch=(any)
url="http://polyglot.rubyforge.org/"
license=('MIT')
depends=('ruby')
makedepends=('rubygems')
source=("http://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-$pkgver.gem")

build() {
  cd $srcdir
  export HOME=/tmp
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install  --no-user-install --ignore-dependencies -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-$pkgver.gem
}

md5sums=('01e313080095caf4dc7ab71fd572a377')
