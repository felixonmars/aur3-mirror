# Contributor: Nicolas Quienot <niQo@aur>
pkgname=remotepad
pkgver=1.10
pkgrel=2
pkgdesc="RemotePad is an open source application that controls the mouse cursor of your desktop PC from your iPhone"
url="http://www.tenjin.org/RemotePad/"
license="GPL"
arch=('i686' 'x86_64' 'armv6h')
depends=('libxtst')
source=(http://iphone-remotepad.googlecode.com/files/RemotePadServer-$pkgver-X11-Source.tgz)
md5sums=('8abe8ba819fe636f7c34603ffbf24bed')

build() {
  cd ${srcdir}/RemotePad\ Server/X11
  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd ${srcdir}/RemotePad\ Server/X11

#  make DESTDIR="$pkgdir/" install

  mkdir -p ${pkgdir}/usr/bin
  install -m 0755 remotepad ${pkgdir}/usr/bin/ 
}
