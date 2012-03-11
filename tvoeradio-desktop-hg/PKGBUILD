# Contributor: and <and@ebrilo.jp>

pkgname=tvoeradio-desktop-hg
pkgver=2.0a
pkgrel=2
pkgdesc="Multiplatform client to listen music from VK.com (VKontakte.ru) and Last.fm services. Mercurial version with hide/show mainwindow and DBus support patch."
arch=('i686' 'x86_64')
url="http://tvoeradio.org/desktop/"
license=('GPL')
depends=('qt' 'qtwebkit')
makedepends=('gcc' 'make' 'pkgconfig' 'mercurial' 'patch')
conflicts=('tvoeradio-desktop-svn' 'tvoeradio-desktop')
provides=('tvoeradio-desktop')
replaces=('tvoeradio-desktop-svn' 'tvoeradio-desktop')
source=('mainwindow.cpp.patch' 'mainwindow.h.patch' 'settingsdialog.cpp.patch' 'settingsdialog.ui.patch' 'tvoeradio-desktop.pro.patch')
md5sums=('7493e54d082ea17acca387226be974f9' '49deac3a0ad56dae19296e53619f2a57' '261e6697501ae3edf2c1cc92023daafe' 'e502c565676932cb4f1b1ca7a5e34f2f' '5ff8e23bcf8149958115d547c605cd03')

build() {
  hg clone https://bitbucket.org/eXtractor/tvoeradio-desktop || return 1
  patch $startdir/src/tvoeradio-desktop/src/mainwindow.cpp $startdir/mainwindow.cpp.patch || return 1
  patch $startdir/src/tvoeradio-desktop/src/mainwindow.h $startdir/mainwindow.h.patch || return 1
  patch $startdir/src/tvoeradio-desktop/src/settingsdialog.cpp $startdir/settingsdialog.cpp.patch || return 1
  patch $startdir/src/tvoeradio-desktop/src/settingsdialog.ui $startdir/settingsdialog.ui.patch || return 1
  patch $startdir/src/tvoeradio-desktop/src/tvoeradio-desktop.pro $startdir/tvoeradio-desktop.pro.patch || return 1
  cd $startdir/src/tvoeradio-desktop/src

  qmake || return 1

  make || return 1
  make INSTALL_ROOT="${pkgdir}" install || return 1

# Add freedesktop compatibility
  install -D -m 664 $srcdir/tvoeradio-desktop/src/img/tvoeradio-desktop.png $pkgdir/usr/share/pixmaps/tvoeradio-desktop.png || return 1
  install -D -m 664 $srcdir/tvoeradio-desktop/src/tvoeradio-desktop.desktop $pkgdir/usr/share/applications/tvoeradio-desktop.desktop || return 1
}
