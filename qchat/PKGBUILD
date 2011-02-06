# Maintainer: Košava <kosava@archlinux.us>

pkgname=qchat
pkgver=0.3
pkgrel=1
pkgdesc="QT4 Local area network (wlan) chat with or without server"
arch=('i686' 'x86_64')
url="http://q-chat.sourceforge.net/"
license=('GPL')
depends=('qt')
source=('http://sourceforge.net/projects/q-chat/files/QChat/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.bz2/download' 'qchat.desktop')
md5sums=('e94f03d11e4a78dff115c3af8c38bac9'
         '7c0769f294d714770e3d66f30de21273')

build() {
   cd ${srcdir}/${pkgname}-${pkgver}   
   install -D -m644 $srcdir/${pkgname}.desktop $pkgdir/usr/share/applications/${pkgname}.desktop 
   qmake PREFIX="/usr/"
   make INSTALL_ROOT=$pkgdir install
}