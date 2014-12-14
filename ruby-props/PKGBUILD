# Maintainer: Niels Martignène <niels.martignene@gmail.com>

pkgname=ruby-props
pkgver=1.1.2
pkgrel=1
pkgdesc="Manage Settings Hierachies (Commandline, User, Home, Defaults, etc.)"
arch=(any)
url="https://github.com/rubylibs/props"
license=('custom')
depends=('ruby')
makedepends=('rubygems')
source=("http://gems.rubyforge.org/gems/props-${pkgver}.gem"
        'LICENSE')
noextract=("props-${pkgver}.gem")
sha256sums=('84dd60f06ab73af568d55c79de01ae29ef85f8d4090f82fce86ede17bc9658d4'
            '9ec8968567ecb4cdf279cbe114e7ae14efc92cde407b22120429ff0210fc812c')

package() {
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies \
    -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" "props-${pkgver}.gem"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
