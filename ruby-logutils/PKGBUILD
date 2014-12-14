# Maintainer: Niels Martignène <niels.martignene@gmail.com>

pkgname=ruby-logutils
pkgver=0.6.1
pkgrel=1
pkgdesc="Another Logger"
arch=(any)
url="https://github.com/rubylibs/logutils"
license=('custom')
depends=('ruby')
source=("http://gems.rubyforge.org/gems/logutils-${pkgver}.gem"
        'LICENSE')
noextract=("logutils-${pkgver}.gem")
sha256sums=('a36dceaaa8adf0de1a78778cf0c24c4ae26d7f424275ca0ed9e78309bef229a3'
            '690efb5287b34ac7394eb53018e55bea831c4f29a844672a687ca83642aad42d')

package() {
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies \
    -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" "logutils-${pkgver}.gem"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
