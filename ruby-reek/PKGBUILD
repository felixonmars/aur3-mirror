# Maintainer: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
#
# Note: namcap warns that 'ruby-ruby_parser', 'ruby-sexp_processor' and
# 'ruby-ruby2ruby' (in the `depends` array) are unnecessary. This is untrue. The
# README.md file states that they are dependencies.

pkgname=ruby-reek
_gemname="${pkgname#ruby-}"
pkgver=1.3.7
pkgrel=1
pkgdesc='A static analysis tool for finding code smells.'
arch=(any)
url='https://github.com/troessner/reek'
license=(MIT)
depends=(ruby-rainbow ruby-ruby_parser ruby-sexp_processor ruby-ruby2ruby)
makedepends=(rubygems)
options=(!emptydirs)
source=("http://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
sha256sums=('ca5a477f64b205207e5195d15b13df32b313ab781d4cdf3b12f7a20776d717d3')

package() {
  # install gem
  HOME=/tmp gem install \
    --no-user-install \
    --ignore-dependencies \
    --install-dir "${pkgdir}$(ruby -rubygems -e 'puts Gem.default_dir')" \
    --bindir "${pkgdir}/usr/bin" \
    "${srcdir}/${_gemname}-${pkgver}.gem"

  # install license
  install -Dm 644 \
    "${pkgdir}"/usr/lib/ruby/gems/*/gems/"${_gemname}-${pkgver}"/License.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/License.txt"
}

# vim:set ts=2 sw=2 et:
