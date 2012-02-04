# Maintainer: Laurent Carlier <lordheavym@gmail.com>

pkgname=subversion-tools
pkgver=0.0.2
pkgrel=1
pkgdesc="A collection of tools for subversion"
arch=(any)
url="http://subversion.tigris.org/tools_contrib.html"
license=('GPL')

depends=('perl')
makedepends=('')

source=('http://svn.apache.org/repos/asf/subversion/trunk/contrib/client-side/svn-clean')

md5sums=('df49c7b64f712d154f148766d2d21777')

build() {
  cd ${srcdir}

  pod2man svn-clean > svn-clean.1

  install -Dm755 svn-clean ${pkgdir}/usr/bin/svn-clean
  install -Dm755 svn-clean.1 ${pkgdir}/usr/share/man/man1/svn-clean.1

}
