#Maintainer: Alex Novitsky <alex.novitsky@dsg-sd.com>
#Contributor:
# Andrzej Giniewicz <gginiu@gmail.com>
# Gabriel Pickl <peacemotion[at]gmail[dot]com>
pkgname=git-repo
pkgver=1.12.16
pkgrel=1
pkgdesc="The Multiple Git Repository Tool."
url="https://code.google.com/p/git-repo/"
arch=('any')
license=('Apache')
depends=('python2' 'git' 'gnupg')
source=("https://bitbucket.org/archstuff/git-repo/raw/arch-v1.12.16/repo")
md5sums=('14d4d10dbed5ab80df23d601c41cb8d2')

package() {
  cd "${srcdir}"
  install -D -m 755 repo "${pkgdir}/usr/bin/repo"
}

