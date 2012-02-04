# created 16:24:11 - 19/08/09
# Contributor: Frikilinux <frikilinux at frikilinux.com.ar> 

pkgname=surfer
pkgver=0.8
pkgrel=1
pkgdesc="Web browser on QtWebKit that focus on usability"
url="http://gitorious.org/surfer"
license=('GPL')
arch=('i686' 'x86_64')
depends=('qt')
makedepends=()
conflicts=('surfer-git')

source=(http://www.qt-apps.org/CONTENT/content-files/110535-surfer-$pkgver.tar.gz surfer.desktop)
md5sums=('697d0a0c25d50aa021297ca94f667777' 'dd28cb2f827ac3056a8bfd17e018a0a2')

build() {
    cd $srcdir/surfer-surfer
        
  qmake || return 1
  make || return 1
  install -Dm755 surfer $pkgdir/usr/bin/surfer || return 1
  install -Dm644 ../surfer.desktop $pkgdir/usr/share/applications/surfer.desktop || return 1
       
}