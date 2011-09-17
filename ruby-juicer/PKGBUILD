# Maintainer: orbisvicis <''.join(chr(ord(c)-1) for c in "pscjtwjdjtAhnbjm/dpn")>
pkgname=ruby-juicer
_gemname="${pkgname#ruby-}"
pkgver=1.0.13
pkgrel=1
pkgdesc="A command-line tool to resolve dependencies, merge, and minify CSS and JavaScript files"
arch=("any")
url="https://github.com/cjohansen/juicer/"
license=("MIT")
depends=("ruby-cmdparse" "ruby-rubyzip" "ruby-nokogiri")
makedepends=("rubygems")
optdepends=("yuicompressor: compress CSS and JavaScript files"
            "closure-compiler: check and optimize JavaScript code"
            "jslint: verify JavaScript syntax")
source=("http://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
sha1sums=("6cb37e31430b95968c09f59630dc08bfda9d9f3c")

package() {
  cd "$srcdir"
  export HOME="/tmp"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --verbose -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"

  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${_gemdir}/gems/${_gemname}-${pkgver}/Readme.rdoc" "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# vim:set ts=2 sw=2 et:
