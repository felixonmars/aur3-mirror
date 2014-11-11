# Maintainer: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
#
# Note: namcap warns that 'ruby-ruby_parser', 'ruby-sexp_processor' and
# 'ruby-ruby2ruby' (in the `depends` array) are unnecessary. This is untrue. The
# README.md file states that they are dependencies.

pkgname=reek
pkgver=1.4.0
pkgrel=1
pkgdesc='A static analysis tool for finding code smells.'
arch=(any)
url='https://github.com/troessner/reek'
license=(MIT)
depends=(ruby-rainbow ruby-ruby_parser ruby-sexp_processor ruby-ruby2ruby)
makedepends=(rubygems)
conflicts=(ruby-reek)
options=(!emptydirs)
source=("http://rubygems.org/downloads/${pkgname}-${pkgver}.gem")
noextract=("${pkgname}-${pkgver}.gem")
sha256sums=('6d54e17196682ab559f210b3d058a1a16c0801f4fc3d4d9182acdb842912b4cc')

package() {
  # install gem
  HOME=/tmp gem install \
    --no-user-install \
    --ignore-dependencies \
    --install-dir "${pkgdir}$(ruby -rubygems -e 'puts Gem.default_dir')" \
    --bindir "${pkgdir}/usr/bin" \
    "${srcdir}/${pkgname}-${pkgver}.gem"

  # install license
  install -Dm 644 \
    "${pkgdir}"/usr/lib/ruby/gems/*/gems/"${pkgname}-${pkgver}"/License.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/License.txt"
}

# vim:set ts=2 sw=2 et:
