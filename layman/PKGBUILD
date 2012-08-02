# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: yetist <yetist@gmail.com>

pkgname=layman
pkgver=1.4.1
pkgrel=1
pkgdesc="A python script for retrieving gentoo overlays."
arch=('i686' 'x86_64')
license=('GPL')
url="http://layman.sourceforge.net"
depends=('python2')
optdepends=('subversion' 'git' 'pyxml') # + more: bzr, cvs, darcs, mercurial, rsync, tar
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('f23994b06907d2102db73175b86b882d')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 setup.py build
  python2 setup.py install --prefix=/usr --root=${pkgdir}
  mkdir -p $pkgdir/usr/local/portage/layman
  mkdir -p $pkgdir/etc/layman
  cp etc/* ${pkgdir}/etc/layman/
  install -D -m644 doc/layman.8 ${pkgdir}/usr/share/man/man8/layman.8
  install -D -m644 doc/layman.8.html ${pkgdir}/usr/share/doc/layman/layman.html
}
