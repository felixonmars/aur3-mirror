# Maintainer: Damian Nowak <damian.nowak@atlashost.eu>

pkgname='rush-http-proxy'
pkgdesc='An advanced ready-to-use HTTP(S) proxy based on node-http-proxy'
pkgver='1'
pkgrel='1'
arch=('i686' 'x86_64')
url='https://github.com/RushPL/rush-http-proxy'
license=('MIT')
depends=('nodejs')
makedepends=('git')
backup=('etc/http-proxy/config.json')
install="$pkgname.install"
source=('config.json'
        'error.html')
sha512sums=('9b940a10a4921abeb2a74265e99b65017be5c1eff0b3f0be2bd20d87a80824259e37322d3af0e564e388a38880201d241523cd04de6dba994b7f94cbe174a717'
            '592eafe65161f951c6676457e7704b29de128e1b1a323bef38c1a55fede57ec61727031b0313832d52eeeacaf6cd18fb71f0b50be29d8dcb77b76c69ea74e282')

package() {
  cd "$pkgdir"

  for d in etc var/log; do
    dir="$d/http-proxy"
    mkdir -p "$dir"
    chmod 0700 "$dir"
  done

  install -m600 "${srcdir}/config.json" "etc/http-proxy/config.json"
  install -m600 "${srcdir}/error.html" "etc/http-proxy/error.html"
}
