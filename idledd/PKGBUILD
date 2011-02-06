# Maintainer: Miro Bogner and Christoph Schuette <miro.bogner@gmail.com, chris.schuette@gmail.com> 

pkgname=idledd
pkgver=0.1
pkgrel=0
pkgdesc="A mac-like backlight-dimming daemon for laptops"
arch=(i686 x86_64)
license=('GPL3')
url="http://sourceforge.net/projects/idledd/"
groups=('daemons')
depends=('gawk' 'acpi' 'xorg-server' 'grep' 'libconfig' 'libxext' 'libxss')
makedepends=('gcc')
conflictss=()
replaces=()
options=()
source=(http://sourceforge.net/projects/idledd/files/$pkgname-$pkgver.tar.gz/download)
md5sums=('dd1c32204f75e4545861b497f0519e5c')

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make
  install -D -m755 idledd $pkgdir/usr/bin/idledd
  install -D -m755 idleddd $pkgdir/etc/rc.d/idledd
  install -D -m644 idledd.conf $pkgdir/etc/conf.d/idledd.conf
}
