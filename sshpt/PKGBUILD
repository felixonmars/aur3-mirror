# Contributor: Nathan Owe. <ndowens04 at gmail>
# Maintainer: Roel Blaauwgeers <roel at ttys0.nl>

pkgname=sshpt
pkgver=1.2.0
pkgrel=2
pkgdesc=" SSH Power Tool"
arch=('i686' 'x86_64')
url="http://code.google.com/p/sshpt"
source=(http://sshpt.googlecode.com/files/${pkgname}-${pkgver}.tar.gz)
license=('GPL3')
md5sums=('945c42befd70e3540f1f48b4e0b1211e')
depends=('python2' 'python2-paramiko')
makedepends=('setuptools')
options=(!emptydirs)

build() {
  cd ${srcdir}/${pkgname}
  python2 setup.py install --root=${pkgdir}
}

