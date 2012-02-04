# Contributor: Emiliano Vavassori <syntaxerrormmm@gmail.com>
# Maintainer: Emiliano Vavassori <syntaxerrormmm@gmail.com>
pkgname=pdfcube-svn
pkgver=60
pkgrel=1
pkgdesc="PDF Cube uses the OpenGL API to add 3D spinning cube page transitions to PDF documents." 
url="http://code.100allora.it/pdfcube" 
depends=(gtkglext poppler poppler-glib freeglut boost freetype2)
makedepends=('subversion')
license=('GPL2')
provides=('pdfcube')
conflicts=('pdfcube')
arch=('i686' 'x86_64')
noextract=()

_svntrunk='http://code.100allora.it/svn/pdfcube/trunk'
_svnmod='pdfcube'

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

  #
  # BUILD
  #
  ./autogen.sh
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 AUTHORS ChangeLog INSTALL NEWS README -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -d "${pkgdir}/usr/share/man/man1"
  install -m644 man/pdfcube.1 "${pkgdir}/usr/share/man/man1/pdfcube.1"
  cd "${pkgdir}/usr/share/doc/${pkgname}"
  gzip *
  gzip "${pkgdir}/usr/share/man/man1/pdfcube.1"
}

