# Contributor: escoand <escoand at freenet dot de>

pkgname=bin32-prism
pkgver=1.0b4
pkgrel=2
pkgdesc="Prism is a simple XULRunner based browser that hosts web applications without the normal web browser user interface."
arch=('x86_64')
url="http://prism.mozilla.com/"
license=('MPL/GPL/LGPL')
depends=('gtk2' 'lib32-gtk2' 'lib32-libxdamage' 'lib32-libxt' 'lib32-pcre' 'xulrunner=1.9.1')
conflicts=('prism-0.9')
source=("http://prism.mozillalabs.com/downloads/$pkgver/prism-$pkgver.en-US.linux-i686.tar.bz2"
        'prism.sh')
noextract=()
# thank andrew9888 and fluke
md5sums=('cf1fc7c191e45a7619d371b0c295c3cb'
         '19bb57723c56fd613dc5977ff4c0823c')

build() {
  install -d $pkgdir/opt/lib32/prism $pkgdir/usr/bin
  install -m755 $srcdir/prism.sh $pkgdir/usr/bin/prism
  cp -R $srcdir/prism/* $pkgdir/opt/lib32/prism/
}
