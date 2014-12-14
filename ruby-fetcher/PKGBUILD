# Maintainer: Niels Martignène <niels.martignene@gmail.com>

pkgname=ruby-fetcher
pkgver=0.4.4
pkgrel=2
pkgdesc="Fetch Text Documents or Binary Blobs via HTTP, HTTPS"
arch=(any)
url="https://github.com/rubylibs/fetcher"
license=('custom')
depends=('ruby' 'ruby-logutils')
source=("http://gems.rubyforge.org/gems/fetcher-${pkgver}.gem"
        'LICENSE')
noextract=("fetcher-${pkgver}.gem")
sha256sums=('92e765e6eef8dc96e9d86be9b619cde02233c207bef8b5832a5c6dbd87712bf9'
            '4fde9916d36bdc2120a09693d9015af0f0d0b970635b7516476a3dbeb52b55ff')

package() {
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies \
    -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" "fetcher-${pkgver}.gem"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

