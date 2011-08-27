# Contributor: Richard Kakaš <richard.kakas@gmail.com>

pkgname=tictactoe
_majver=1.0
pkgver=${_majver}.0
pkgrel=1
pkgdesc="Simple TicTacToe game made in Qt."
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/tictactoe-qt/"
license=('GPL')

depends=('qt')
makedepends=('cmake' 'git') 

source=(
	"${pkgname}-${pkgver}.tar.gz::http://downloads.sourceforge.net/project/tictactoe-qt/v${_majver}/v${pkgver}/tictactoe-${pkgver}.tar.gz?use_mirror=kent"
)
md5sums=('cbaf9478d42b7e10dc837e3191639aae')

install=("tictactoe.install")

build() {
	# move to dir
	cd ${srcdir}/${pkgname}-${pkgver}

	# building and installing of project
    msg "Starting building...."
	cd ${srcdir}/${pkgname}
	cmake -D CMAKE_INSTALL_PREFIX=/usr . || return 1
	make clean || return 1
	make all || return 1
	make DESTDIR="${pkgdir}" install || return 1
    msg "Build done."
}

