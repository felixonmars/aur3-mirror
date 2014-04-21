# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
# Maintainer: Roel Blaauwgeers <roel at ttys0.nl>
pkgname=conky-email
pkgver=2.15
pkgrel=3
pkgdesc="A simple script to display the count of emails in conky."
arch=('any')
url="https://code.launchpad.net/~conky-companions/+archive/ppa/+files/conkyemail_$pkgver.tar.gz"
license=('GPL3')
depends=('python2' 'python2-keyring')
install=${pkgname}.install
source=("https://launchpad.net/~conky-companions/+archive/ppa/+files/conkyemail_${pkgver}.tar.gz")
md5sums=('516e23f9ea9bec38bf7e008fced5b443')

build() {
  cd ${srcdir}/src
  python2 setup.py build 
}

package() {
  cd ${srcdir}/src
  python2 setup.py install --root=${pkgdir} 
  install -Dm644 README ${pkgdir}/usr/share/conkyemail/README 
}

