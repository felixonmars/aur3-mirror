# Maintainer: Sascha Weaver <wzyboies@gmail.com>

pkgname=shadowsocks-nodejs-git
_pkgname=shadowsocks-nodejs
_insdir="/opt/${_pkgname}"
pkgver=151.f36874b
pkgrel=1
pkgdesc="A lightweight tunnel proxy which can help you get through firewalls. A port of shadowsocks."
arch=("any")
url="https://github.com/clowwindy/shadowsocks-nodejs"
depends=("nodejs")
makedepends=("git")
conflicts=("shadowsocks-nodejs")
provides=("shadowsocks-nodejs")
license=("MIT")
backup=(opt/shadowsocks-nodejs/config.json)
install=shadowsocks-nodejs.install
source=('git://github.com/clowwindy/shadowsocks-nodejs.git'
        'shadowsocks-nodejs.service')
sha256sums=('SKIP'
            'a1f55d09b94d294ddf2ebaa88e867a2fde51a1064d56cf4651900f95ea2befb3')

pkgver() {
  cd ${_pkgname}
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  mkdir -p "${pkgdir}/${_insdir}"
  cd ${_pkgname}
  rm -rf .git .travis.yml src test Cakefile local.bat package.json
  cp -a * "${pkgdir}/${_insdir}"
  mkdir -p "${pkgdir}/usr/bin"
  cd "${pkgdir}/usr/bin"
  ln -s "${_insdir}/bin/sslocal"
  ln -s "${_insdir}/bin/ssserver"
  install -Dm644 "${srcdir}/${_pkgname}.service" \
                 "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
}
