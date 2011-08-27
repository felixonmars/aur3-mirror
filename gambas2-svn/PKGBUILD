# Contributor: Leonardo Miliani <leonardo at leonardomiliani dot com>

pkgname=gambas2-svn
pkgver=2793
pkgrel=1
pkgdesc="A free development environment based on a Basic interpreter - SVN version"
arch=('i686' 'x86_64')
url="http://gambas.sourceforge.net"
depends=('librsvg' 'postgresql-libs' 'libmysqlclient' \
         'curl' 'poppler' 'sqlite3' 'sdl_mixer' 'sdl_image' \
         'unixodbc' 'kdelibs3' 'libffi' 'omniorb'
         'postgresql' 'libfbclient' 'sqlite2')
makedepends=('intltool' 'xdg-utils' 'mysql' 'libxtst' 'subversion')
optdepends=('rpm: to create a rpm package of your Gambas Project'
	'debhelper: to crete a deb package of your Gambas Project')
provides=("${pkgname%-svn}")
conflicts=("${pkgname%-svn}")
license=('GPL2')
options=('!makeflags' '!libtool')
source=('gambas2.desktop' 'gambas2.png')
md5sums=('e6c2df38b29fcb6ba9ac7ba783688211'
	'32672c984d8487beb13aa5b6bc6868e2')
	
_svntrunk=https://gambas.svn.sourceforge.net/svnroot/gambas/gambas/branches/2.0
_svnmod=${pkgname%-svn}
_revnumber=$pkgver

install=${pkgname}.install

build() {
  #fix for solving libqt-mt library missing during compilation
  ##of last Gambas2 versions
  [ -z "${QTDIR}" ] && . /etc/profile.d/qt.sh 
  
  cd ${srcdir}
  msg "Connecting to SVN server...."

  if [ -d ${_svnmod}/.svn ]; then
    msg "Updating sources..."
    (cd ${_svnmod} && svn up -r $pkgver)
  else
    msg "Start downloading sources..."
    svn co ${_svntrunk} --config-dir ./ -r $pkgver ${_svnmod}
  fi

  msg "SVN checkout done or server timeout"
  msg "Exporting source codes..."
  svn export ${_svnmod} ${_svnmod}-build
  cd ${_svnmod}-build
  
  msg "Reconfiguring Gambas, please wait a while..."
  ./reconf-all
  
  msg "Starting compiling..."
  . /etc/profile.d/kde3.sh
  . /etc/profile.d/qt3.sh

  ./configure -C --disable-qte --prefix=/usr
  make bindir=${pkgdir}/usr/bin || return 1
  make XDG_UTILS='' DESTDIR=${pkgdir} install || return 1

  install -d -m755 ${pkgdir}/usr/share/gambas2/mime || return 1
  install -D -m644 main/mime/* \
    ${pkgdir}/usr/share/gambas2/mime/ || return 1

  install -d -m755 ${pkgdir}/usr/share/gambas2/icons || return 1
  install -D -m644 main/mime/application-x-gambas.png \
    ${pkgdir}/usr/share/gambas2/icons/application-x-gambas.png ||  return 1
  install -D -m644 ${srcdir}/gambas2.desktop \
    ${pkgdir}/usr/share/applications/gambas2.desktop || return 1
  install -D -m644 ${srcdir}/gambas2.png \
    ${pkgdir}/usr/share/pixmaps/gambas2.png || return 1

  chown root:root -R ${pkgdir}/usr/share/gambas2/help/help || return 1

}
