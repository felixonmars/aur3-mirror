# Contributor: Anischenko Alexandr (Dganic) [rus36] <dganic (at) bmail.ru>
pkgname=tvoeradio-desktop-svn
pkgver=5
pkgrel=1
pkgdesc="Multiplatform client to listen music from VKontakte.ru and Last.fm services. SVN version"
arch=('i686' 'x86_64')
url="http://code.google.com/p/tvoeradio-desktop/"
license=('GPL')
depends=('qt')
makedepends=('gcc' 'make' 'subversion' 'pkgconfig')
optdepends=(
 'Login vk.com or last.fm is required'
 'Notification daemon/aplet'
 'Flash Player'
 'Java'
)
conflicts=('tvoeradio-desktop')
provides=('tvoeradio-desktop')
replaces=('tvoeradio-desktop')

_svnmod=tvoeradio-desktop-read-only
_svntrunk=http://tvoeradio-desktop.googlecode.com/svn/trunk

build() {

  svn co $_svntrunk $_svnmod

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  qmake DESTDIR="${pkgdir}/usr/bin" || return 1

  make || return 1
  make DESTDIR="${pkgdir}" install || return 1

# Add freedesktop compatibility
  install -D -m 664 $srcdir/$_svnmod-build/images/icon512.png $pkgdir/usr/share/pixmaps/tvoeradio-desktop.png || return 1
  install -D -m 664 $srcdir/$_svnmod-build/tvoeradio-desktop.desktop $pkgdir/usr/share/applications/tvoeradio-desktop.desktop || return 1
  
  rm -rf ${srcdir}/$_svnmod-build
}

