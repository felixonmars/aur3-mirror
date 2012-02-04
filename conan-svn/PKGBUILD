# Contributor: Ricardo Honorato-Zimmer <rata@cbuc.cl>

pkgname=conan-svn
pkgver=481
pkgrel=1
pkgdesc="COmplex Network ANalysis - C++/Python library to construct, analize and infere complex networks"
arch=('i686' 'x86_64')
url="http://www.cbuc.cl/projects/conan/"
license=('GPL3')
depends=('boost' 'gsl' 'python')
makedepends=('make' 'gcc' 'subversion')
conflicts=('conan')
replaces=('conan')
source=()
md5sums=()

_svntrunk="https://www.cbuc.cl/svn/conan"
_svnmod="conan"

build() {
  msg "Starting SVN checkout..."
  cd ${srcdir}
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "Building and installing Conan..."
  cd ${srcdir}/conan/
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
