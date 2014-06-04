# Maintainer: Gilrain <pierre.buard+aur gmail com>
_pkgname=stratum-mining-proxy
pkgname=stratum-mining-proxy-git
pkgver=169.33e645d
pkgrel=1
pkgdesc="Getwork-compatible proxy for Stratum mining pools."
url="http://mining.bitcoin.cz/stratum-mining/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('python2-pyopenssl' 'python2-stratum')
makedepends=('git')
backup=('etc/conf.d/mining-proxy.conf')
source=(${_pkgname}::git://github.com/slush0/${_pkgname}.git
	conf
	service)
md5sums=('SKIP'
	 '78479e0043a327ad35000a2bd9f495b7'
	 '4d765e3345adda05339814e73650de92')

pkgver() {
  cd ${_pkgname}
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/${_pkgname}/midstatec
  make
}

package() {
  cd ${srcdir}/${_pkgname}
  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 midstatec/midstate.so ${pkgdir}/usr/lib/midstate.so
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${_pkgname}/README.md

  install -Dm644 ${srcdir}/conf ${pkgdir}/etc/conf.d/mining-proxy.conf
  install -Dm644 ${srcdir}/service ${pkgdir}/usr/lib/systemd/system/mining-proxy.service
}
