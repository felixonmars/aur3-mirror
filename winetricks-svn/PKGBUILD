# Mantainer: M0Rf30
pkgname=winetricks-svn
pkgver=1217
pkgrel=1
pkgdesc='Script to install various redistributable runtime libraries in Wine.'
url='http://wiki.winehq.org/winetricks'
license=('LGPL')
arch=('any')
depends=('wine' 'cabextract' 'unzip' 'xorg-xmessage' 'wget')
makedepends=('subversion')
optdepends=('zenity: GUI for GNOME desktop'
            'kdebase-kdialog: GUI for KDE desktop')
conflicts=('winetricks' 'bin32-winetricks')
replaces=('bin32-winetricks' 'winetricks')
provides=('winetricks')
_svnmod='winetricks'
source=("${_svnmod}::svn+http://winetricks.googlecode.com/svn/trunk/src")


pkgver() {
  cd "${srcdir}/${_svnmod}"
  svnversion
}

package() {
  install -Dm755 ${_svnmod}/winetricks ${pkgdir}/usr/bin/winetricks
  install -Dm755 ${_svnmod}/winetricks.1 ${pkgdir}/usr/share/man/man1/winetricks.1
}

md5sums=('SKIP')
