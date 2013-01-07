# Contributor: markuman <markuman@gmail.com>

_pkgname=qucs
pkgname=$_pkgname-svn
pkgver=1848
pkgrel=1
pkgdesc="An integrated circuit simulator with a graphical user interface. (qt4 svn version)"
arch=('i686' 'x86_64')
url="http://qucs.sourceforge.net"
license=('GPL')
depends=('qt')
makedepends=('svn' 'autoconf' 'automake')
optdepends=('freehdl: to permit digital circuit simulation'
	    'asco: to enable circuit optimization'
	    'perl')
conflicts=($_pkgname)


build() {
  svn checkout svn://svn.code.sf.net/p/qucs/code/trunk qucs-code
  cd $srcdir/$_pkgname-code/$_pkgname
  ${ACLOCAL:-aclocal}
  autoheader
  ${AUTOMAKE:-automake} -a -f -c
  autoconf
  ./configure --prefix=/usr
  make
  make DESTDIR=$pkgdir install
}
