# Maintainer: skeleton <tobiasgold at gmx .net>
pkgname=analog-vu-meter-plugin
pkgver=1.0.0
pkgrel=1
pkgdesc="VU meter plugin for Audacious"
realname=analog-vu-meter-plugin
arch=('i686' 'x86_64')
url="http://vumeterplugin.sourceforge.net/"
license=('GPL')
depends=('audacious')
source=(http://downloads.sourceforge.net/project/vumeterplugin/Plugin%20for%20Audacious/${realname}-${pkgver}-beta.tar.gz)
md5sums=('4decf7e60c50a894faa0342ead0e705d')

build() {
  cd ${realname}-${pkgver}-beta
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
