# Maintainer: Niels Martignène <niels.martignene@gmail.com>

pkgname=ruby-textutils
pkgver=1.0.1
pkgrel=1
pkgdesc="Text Filters and Helpers"
arch=(any)
url="https://github.com/rubylibs/textutils"
license=('custom')
depends=('ruby' 'ruby-activesupport' 'ruby-logutils' 'ruby-props' 'ruby-rubyzip')
source=("http://gems.rubyforge.org/gems/textutils-${pkgver}.gem"
        'LICENSE')
noextract=("textutils-${pkgver}.gem")
sha256sums=('3bcccfaa2d6f27cd9da2e7508272b1dd4c596b60ce08d63052ee78a7eb0f17d8'
            '827a633f1202ca9dd4dd6da61c1485b558eb6298def4da6979d0f9e3c9fbe643')

package() {
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies \
    -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" "textutils-${pkgver}.gem"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
