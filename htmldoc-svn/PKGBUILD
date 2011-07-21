# $Id: PKGBUILD 51081 2011-07-05 07:09:42Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: tobias <tobias@archlinux.org>
# Contributor: Simon Rutishauser <simon.rutishauser@gmx.ch>

pkgname=htmldoc-svn
pkgver=1666
pkgrel=1
pkgdesc="Produce PDF or Postscript from HTML documents including TOCs and Indices"
arch=(i686 x86_64)
url="http://www.htmldoc.org"
license=('GPL')
depends=('libjpeg' 'libpng' 'openssl' 'fltk' 'gcc' 'libxft' 'libxpm')
source=()
md5sums=()

_svntrunk=http://svn.easysw.com/public/htmldoc/trunk/
_svnmod=htmldoc

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
  [ -x configure ] || autoconf
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_svnmod-build"

  make install \
	prefix=${pkgdir}/usr \
	bindir=$pkgdir/usr/bin \
	datadir=$pkgdir/usr/share \
	datarootdir=$pkgdir/usr/share \
	docdir=$pkgdir/usr/share/doc/htmldoc \
	exec_prefix=$pkgdir/usr \
	mandir=$pkgdir/usr/share/man \
	prefix=$pkgdir/usr \
	sysconfdir=$pkgdir/etc

 # fix freedesktop stuff
  install -Dm 644 desktop/htmldoc-128.png \
    ${pkgdir}/usr/share/pixmaps/htmldoc.png
  echo "MimeType=application/vnd.htmldoc-book;" >> desktop/htmldoc.desktop
  sed -i 's|X-Red-Hat.*$||' desktop/htmldoc.desktop
  install -Dm 644 desktop/htmldoc.desktop \
    ${pkgdir}/usr/share/applications/htmldoc.desktop
}
