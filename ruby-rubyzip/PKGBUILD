# Maintainer: Niels Martignène <niels.martignene@gmail.com>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=ruby-rubyzip
pkgver=1.1.7
pkgrel=1
pkgdesc='Ruby module for reading and writing zip files'
arch=(any)
url='http://github.com/rubyzip/rubyzip'
license=('BSD')
depends=('ruby')
options=(!emptydirs)
source=("https://rubygems.org/downloads/rubyzip-${pkgver}.gem"
        'LICENSE')
noextract=("rubyzip-$pkgver.gem")
sha256sums=('24ab7c93f05eb8f6ec1c6c110f60bb5f0f2fa54b09e95eaa3b097e0fe5640133'
            '5572bf03c3c8c4770e8153038f5f54faad9c3db9900864a7c82a19de4434d74b')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install \
    -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" "rubyzip-${pkgver}.gem"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"  
}
