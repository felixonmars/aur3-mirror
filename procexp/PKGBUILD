#Maintainer: Stephen Zhang <zsrkmyn@gmail.com>
pkgname=procexp
pkgver=1.7.289
pkgrel=1
pkgdesc="Graphical process explorer for Linux."
arch=('any')
url="http://sourceforge.net/projects/procexp/"
license=('GPL2')
install=$pkgname.install
#depends=('schedutils' 'python' 'libqwt5-qt4' 'python-qt4' 'python-suppor' 'python-qwt5-qt4' 'python-configobj' 'ethtool' 'policykit-1' 'tcpump')
depends=('util-linux' 'pyqwt' 'python2' 'python2-pyqt4' 'python2-configobj' 'tcpdump' 'polkit')
optdepends=('ethtool: obtain ethernet cards statistics')
options=(docs)
source=(http://downloads.sourceforge.net/project/${pkgname}/bin_v1/${pkgname}_${pkgver}-0ubuntu1_all.deb)
md5sums=('5ce96fd6a5772f4e371ab863f032450f')

package() {
	cd $srcdir
	tar -zxvf data.tar.gz
	sed -e '20s#python#/usr/bin/python2.7#' $srcdir/usr/bin/procexp.sh > $srcdir/usr/bin/procexp
	rm $srcdir/usr/bin/procexp.sh
	
	sed -i -e '5s/.sh//' $srcdir/usr/share/applications/procexp.desktop

	chmod a+x $srcdir/usr/bin/procexp

	cp -dpr --no-preserve=ownership $srcdir/usr/ $pkgdir/
	chmod a+x $pkgdir/usr/lib/procexp/rootproxy/procroot.py
}
