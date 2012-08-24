# Maintainer: Roman Lapin <lampus.lapin@gmail.com>

pkgname=('doxverilog-svn')
pkgver=54
pkgrel=1
_doxyver=1.8.1
_doxyname='doxygen'
license=('GPL')
arch=(i686 x86_64)
url="http://developer.berlios.de/projects/doxverilog/"
makedepends=('gcc-libs' 'flex' 'qt' 'texlive-core' 'ghostscript' 'texlive-latexextra')
source=("ftp://ftp.stack.nl/pub/users/dimitri/${_doxyname}-${_doxyver}.src.tar.gz")
md5sums=('058f7b0c6cd4d47feda106b938a43818')
sha1sums=('7a340a866ba9f55d941fb1de30dfb8a3d23109b2')

_svntrunk='http://svn.berlios.de/svnroot/repos/doxverilog/trunk/doxverilog/Doxverilog2.7'
_svnmod='doxverilog'

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  cp ${srcdir}/${_svnmod}/sources/* ${srcdir}/${_doxyname}-${_doxyver}/src
  
  cd "${srcdir}/${_doxyname}-${_doxyver}"
  (cd src && patch -F3 -p0 < ${srcdir}/${_svnmod}/linux.patch)
  QTDIR=/usr ./configure --prefix /usr --with-doxywizard
  make
}

package() {
  pkgdesc="A documentation system for Verilog based on Doxygen (not conflicts with Doxygen)"
  depends=('gcc-libs')
  optdepends=('graphviz: for caller/callee graph generation'
              'qt: for doxywizard')

  cd "${srcdir}/${_doxyname}-${_doxyver}"
  make INSTALL="${pkgdir}"/usr MAN1DIR=share/man/man1 install
  mv ${pkgdir}/usr/bin/doxygen ${pkgdir}/usr/bin/${_svnmod}
  mv ${pkgdir}/usr/bin/doxywizard ${pkgdir}/usr/bin/doxverilogwizard
  mv ${pkgdir}/usr/share/man/man1/doxygen.1 ${pkgdir}/usr/share/man/man1/doxverilog.1
  mv ${pkgdir}/usr/share/man/man1/doxywizard.1 ${pkgdir}/usr/share/man/man1/doxverilogwizard.1
}
