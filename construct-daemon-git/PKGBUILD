# Maintainer: Rob Gilson <d1plo1d@d1plo1d.com>
pkgname='construct-daemon-git'
_gitname='construct-daemon'
pkgver=7b50c7e
pkgrel=3
pkgdesc="A 3D printer daemon to remotely control and monitor 3D printers via the construct protocol."
url="https://github.com/D1plo1d/construct-daemon"
arch=('any')
license=('MIT')
depends=('nodejs' 'python2' 'avahi' 'make' 'gcc')
optdepends=()
makedepends=()
conflicts=('construct-daemon')
replaces=()
backup=()
install=$pkgname.install
source=("git+https://github.com/D1plo1d/construct-daemon.git#branch=develop")
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "${srcdir}/${_gitname}"
  npm install --no-bin-links
  ./script/compile_arduino_reset.sh
}

package() {
  install -dm755 ${pkgdir}/usr/{bin,share/construct-daemon/{bin,lib,node_modules,public}}
  cp -R "${srcdir}/${_gitname}/bin" "${pkgdir}/usr/share/construct-daemon/"
  cp -R "${srcdir}/${_gitname}/lib" "${pkgdir}/usr/share/construct-daemon/"
  cp -R "${srcdir}/${_gitname}/node_modules" "$pkgdir/usr/share/construct-daemon/"
  install -Dm644 "${srcdir}/${_gitname}/package.json" "$pkgdir/usr/share/construct-daemon/package.json"

  mkdir -p "${pkgdir}/etc/systemd/system/"
  install "${srcdir}/${_gitname}/construct-daemon.service" "${pkgdir}/etc/systemd/system/construct-daemon.service"
  chown root:root "${pkgdir}/etc/systemd/system/construct-daemon.service"

  ln -s /usr/share/construct-daemon/bin/construct-daemon $pkgdir/usr/bin/construct-daemon
}