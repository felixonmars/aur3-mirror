# Maintainer: Louis-Guillaume Gagnon <louis.guillaume.gagnon@gmail.com>
pkgname=randfile
pkgver=1
pkgrel=1
pkgdesc="simple utility to pick a random file in a directory"
arch=('any')
url="https://github.com/gagnonlg/randfile"
license=('X11')
depends=('bash')
source=(git+https://github.com/gagnonlg/randfile.git)
md5sums=('SKIP')

package() {
	cd ${srcdir}/${pkgname}
        mkdir -p ${pkgdir}/usr/bin
        cp randfile ${pkgdir}/usr/bin
}
