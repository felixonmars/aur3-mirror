# Maintainer: Bryan Allred <bryan@revolvingcow.com>

_pkgname=code
pkgname=$_pkgname-git
pkgver=20140711
pkgrel=1
pkgdesc="Version control system wrapper allowing the developer to worry about only having to learn one command set to manage all types of repositories."
arch=('i686', 'x86_64')
url="https://github.com/revolvingcow/code"
license=("GPL2")
depends=('python')
optdepends=('mercurial' 'git' 'bzr')
makedepends=('git')
providers=("$_pkgname")
conflicts=("$_pkgname")
source=("git://github.com/revolvingcow/code.git#branch=master")
sha256sums=("SKIP")

package() {
    mkdir -p ${pkgdir}/usr/share/${_pkgname}
    cp -r ${srcdir}/${_pkgname}/ ${pkgdir}/usr/share

    mkdir -p ${pkgdir}/usr/bin
    ln -s /usr/share/code/code.py ${pkgdir}/usr/bin/code
}
