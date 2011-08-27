# Contributor: James Feng Cao <jamesfengcao@yahoo.com>

pkgname=pdfminer-svn
pkgver=159
pkgrel=1
pkgdesc="python utils to extract& analyze text data of PDF files."
arch=('i686' 'x86_64')
url="http://www.unixuser.org/~euske/python/pdfminer/"
license=('MIT/X')
depends=('python')
makedepends=('subversion')
conflicts=('pdfminer')
source=()
md5sums=()

_svnurl="http://pdfminerr.googlecode.com/svn/trunk/"
_svnmod="pdfminerr-read-only"

build() {
  cd "$srcdir"
  if [ -e "${_svnmod}"/.svn ]
	then
		msg "Starting SVN update ..."
		cd "${_svnmod}"
		svn up
		cd "${srcdir}"
		msg "... updating finished."
	else
		msg "Starting SVN checkout ..."
	  svn co $_svnurl $_svnmod
		msg "... checkout finished."
	fi

	if [ -e "${_svnmod}"-build ]
	then
		rm -rf "${_svnmod}"-build
	fi

  cp -r "${_svnmod}" "${_svnmod}"-build
  cd "${_svnmod}"-build
  
  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cd $srcdir/${_svnmod}-build/pdfminer
  cp Makefile Makefile.bak
  sed 's/PREFIX=\/usr\/local//' Makefile.bak > Makefile
  make PREFIX=$pkgdir/usr install || return 1
  rm Makefile.bak
}
