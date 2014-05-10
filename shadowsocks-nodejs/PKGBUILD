# Maintainer: Sascha Weaver <wzyboies@gmail.com>

pkgname=shadowsocks-nodejs
groups=shadowsocks
_npmname=shadowsocks
pkgver=1.4.12
pkgrel=1
pkgdesc="A lightweight tunnel proxy which can help you get through firewalls. A port of shadowsocks."
arch=("any")
url="https://github.com/clowwindy/shadowsocks-nodejs"
depends=("nodejs>=0.8.0")
conflicts=("shadowsocks-nodejs-git")
license=("MIT")
backup=("usr/lib/node_modules/${_npmname}/config.json")
install=shadowsocks-nodejs.install
source=("http://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz"
        "shadowsocks-nodejs.service")
sha256sums=('1fe91d2404e25f8c4123951066d7984db7d4290896a104a6c3363e8ba2fde2e4'
            '9d22d6db681c2bede9c403e8227c2c58cbf682e6affa3eec4a51411dd048c468')
noextract=(${_npmname}-${pkgver}.tgz)

package() {
  npm install -g --prefix "${pkgdir}/usr" ${_npmname}-${pkgver}.tgz
  cd "${pkgdir}/usr/lib/node_modules/${_npmname}"
  rm -r .idea .travis.yml package.json Cakefile src test
  install -Dm644 "${srcdir}/${pkgname}.service" \
                 "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
