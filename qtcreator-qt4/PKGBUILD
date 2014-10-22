pkgname=qtcreator-qt4
_pkgname=qt-creator
pkgver=3.2.2
pkgrel=3
pkgdesc='Lightweight, cross-platform integrated development environment'
arch=('i686' 'x86_64')
url='http://qt-project.org'
license=('LGPL')
depends=('qt4')
makedepends=('make' 'gcc')
provides=('qtcreator')
conflicts=('qtcreator')
optdepends=('gdb: for the debugger'
'cmake: for cmake project support'
'openssh-askpass: for ssh support'
'git: for git support'
'mercurial: for mercurial support'
'bzr: for bazaar support'
'valgrind: for analyze support')
install=qtcreator.install
source=("http://download.qt-project.org/official_releases/qtcreator/3.2/${pkgver}/qt-creator-opensource-src-${pkgver}.tar.gz" "qtcreator.desktop")
md5sums=("5200383689326bb170094e8bb27957b6" "82888d4be900e7833d768050a135cd37")

build()
{
	cd "$srcdir/$_pkgname-opensource-src-${pkgver}"
	qmake-qt4 && make
}

package()
{
	cd "$srcdir/$_pkgname-opensource-src-${pkgver}"

	make INSTALL_ROOT="$pkgdir/usr/" install
	# make INSTALL_ROOT="$pkgdir/usr/" install_docs

	install -Dm644 "$srcdir/qtcreator.desktop" "$pkgdir/usr/share/applications/qtcreator.desktop"
	install -Dm644 "$srcdir/$_pkgname-opensource-src-$pkgver/LGPL_EXCEPTION.TXT" "$pkgdir/usr/share/licenses/qtcreator/LGPL_EXCEPTION.TXT"
}
