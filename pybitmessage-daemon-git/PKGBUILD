# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=pybitmessage-daemon-git
pkgver=20130904
pkgrel=1
pkgdesc="PyBitmessage API"
arch=('any')
depends=('pybitmessage-git' 'python2')
makedepends=('git')
url="https://github.com/Dokument/PyBitmessage-Daemon"
license=('MIT')
source=(${pkgname%-git}::git+https://github.com/Dokument/PyBitmessage-Daemon)
sha256sums=('SKIP')
provides=('pybitmessage-daemon')
conflicts=('pybitmessage-daemon')
install=pybitmessage-daemon.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing executable...'
  install -D -m755 daemon.py "${pkgdir}/usr/bin/pybitmessage-daemon"

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
