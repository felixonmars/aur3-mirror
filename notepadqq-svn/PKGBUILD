# Mantainer: dpriest <wenhaoz100 [at] gmail [dot] com>

pkgname=notepadqq-svn
pkgver=135
pkgrel=1
pkgdesc="A Linux clone of Notepad++"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/notepadqq/"
license=('GPL3')
depends=('qt' 'qscintilla')
#optdepends=('kdebase-workspace')
makedepends=('libstdc++5')
#provides=('bespin')
#conflicts=('bespin' 'kdemod4-kstyles')
source=()
md5sums=()

_svntrunk="https://notepadqq.svn.sourceforge.net/svnroot/notepadqq/trunk/src"
_svnmod="notepadqq"

build() {
  cd ${srcdir}

  if [[ -d ${_svnmod}/.svn ]]; then
     (cd ${_svnmod} && svn up -r $pkgver)
  else
     svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${srcdir}/${_svnmod}-build
  cp -r ${srcdir}/${_svnmod} ${srcdir}/${_svnmod}-build
  cd ${srcdir}/${_svnmod}-build

  qmake
  make
}

package() {
  cd ${srcdir}/${_svnmod}-build
  install -d ${pkgdir}/usr/bin
  install -d ${pkgdir}/usr/share/applications
  install -d ${pkgdir}/usr/share/icons/hicolor/scalable/apps
  install -d ${pkgdir}/usr/share/pixmaps

  install -m0755 ../build/notepadqq ${pkgdir}/usr/bin/
  install -m0644 sys_files/usr/share/applications/notepadqq.desktop ${pkgdir}/usr/share/applications/
  install -m0644 sys_files/usr/share/icons/hicolor/scalable/apps/notepadqq.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/
  install -m0644 sys_files/usr/share/pixmaps/{notepadqq_32x32.xpm,notepadqq_16x16.xpm} ${pkgdir}/usr/share/pixmaps/
  cp -r sys_files/usr/share/notepadqq ${pkgdir}/usr/share/
}
