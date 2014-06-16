# Author: Evgeniy "arcanis" Alexeev <esalexeev@gmail.com>
# Maintainer: Evgeniy "arcanis" Alexeev <esalexeev@gmail.com>

pkgname=git-etc
pkgver=2.3.1
pkgrel=2
pkgdesc="Simple daemon for monitoring changes in files"
arch=('any')
url="http://arcan1s.github.io/projects/git-etc"
license=("GPL3")
depends=('git')
makedepends=('python2')
optdepends=('python2-pyqt4: for GUI'
            'xterm: for GUI')
source=(https://github.com/arcan1s/git-etc/releases/download/V.${pkgver}/${pkgname}-${pkgver}-src.tar.xz)
md5sums=('92d7f3ca99e52c9bf1ff1e97a4198e6b')
backup=('etc/git-etc.conf')

package() {
  "${srcdir}/${pkgname}/install.sh" "${pkgdir}"
}
