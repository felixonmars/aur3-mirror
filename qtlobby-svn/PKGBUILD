# Contributor: DuGi <dugi@irc.pl>

pkgname=qtlobby-svn
pkgver=592
pkgrel=1
pkgdesc="A lobby for Spring RTS using the QT toolkit."
url="http://code.google.com/p/qtlobby/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('qt' 'qscintilla')
makedepends=('subversion' 'cmake')
provides=('qtlobby')
source=()
md5sums=()

_svntrunk=http://qtlobby.googlecode.com/svn/trunk/
_svnmod=qtlobby

build() {
  cd ${srcdir}

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  cmake -DCMAKE_INSTALL_PREFIX=/usr . || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
  
  install -m755 -d ${pkgdir}/usr/share/applications
  install -m644 ${srcdir}/$_svnmod-build/src/qtlobby.desktop ${pkgdir}/usr/share/applications

  install -m755 -d ${pkgdir}/usr/share/pixmaps
  install -m644 ${srcdir}/$_svnmod-build/share/qtlobby/icons/qtlobby.svg ${pkgdir}/usr/share/pixmaps

  rm -rf ${srcdir}/$_svnmod-build
}
