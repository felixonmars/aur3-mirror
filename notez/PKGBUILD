# Contributor: Gleb Sinyavsky <zhulik.gleb@gmail.com>

pkgname=notez
pkgver=0.6
pkgrel=1
pkgdesc="Note taking application optimized for taking lecture notes"
arch=('i686' 'x86_64')
url="http://github.com/zhulik/notez"
license=('GPL')
depends=('p7zip' 'mimetex' 'qt')
install=$pkgname.install
source=("http://zhulik.homelinux.org/$pkgname-$pkgver.tar.gz")
md5sums=('cc5bf054973cad7ae553be599fea1c01')

build() {
  cd $srcdir/$pkgname
  qmake || return 1
  make || return 1
  #make install --root=${pkgdir} || return 1
  make INSTALL_ROOT="$pkgdir/" install || return 1
  install -D -m755 bin/notez ${pkgdir}/usr/bin/notez
}
