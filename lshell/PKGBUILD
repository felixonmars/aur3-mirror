# Contributor: Archme <archme.mail@gmail.com>
# Maintainer: Roel Blaauwgeers <roel at ttys0.nl>

pkgname=lshell
pkgver=0.9.16
pkgrel=1
pkgdesc="Limited Shell, lets you restrict a user's environment to limited sets of commands, and more"
url="http://lshell.ghantoos.org/"
license=('GPL')
arch=(any)
backup=('etc/lshell.conf')
depends=('python2')
source=("${pkgname}-${pkgver}.tar.gz::https://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz/download")
md5sums=('6630e2e2200fbe5d1376dcad26daf6be')

package() {
      cd ${srcdir}/${pkgname}-${pkgver}
        python2 setup.py install --root=${pkgdir} --optimize=1 || return 1
}
