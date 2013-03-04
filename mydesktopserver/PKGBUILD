# Maintainer: Zolotopypov Vladimir (zvova7890@gmail.com)


pkgname=mydesktopserver
pkgver=0.4
pkgrel=1
pkgdesc="Programm for sharing files via internet (written on Qt)"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/mydesktopserver/"
license=('GPL')
depends=('qt4' 'dbus')
source=('http://master.dl.sourceforge.net/project/mydesktopserver/MyDesktopServer-0.4.tar.gz')
md5sums=('a26a98f5821e1f0e63424bb93d77dd73')

build() {
  cd ${srcdir}

  qmake-qt4
  make
}

package() {
  cd ${srcdir}

  # install executable
  install -Dm755 MyDesktopServer ${pkgdir}/usr/bin/mydesktopserver
}

