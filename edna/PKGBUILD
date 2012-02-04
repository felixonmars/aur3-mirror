# Maintainer: Scott Hansen (firecat53) scottandchrystie at comcast dot net 
pkgname=edna
pkgver=0.6
pkgrel=2
pkgdesc="Allows you to access your music collection from any networked computer. This software streams your music via HTTP to any music player that supports streaming from a remote connection."
arch=('any')
url="http://edna.sourceforge.net/"
license=('GPL')
depends=('python2' 'sudo')
optdepends=('pyogg' 'pyvorbis')
makedepends=('patch')
backup=(etc/${pkgname}/${pkgname}.conf)
install=edna.install
source=('http://sourceforge.net/projects/$pkgname/files/edna/$pkgver/$pkgname-$pkgver.tar.gz/download' 'arch.patch')
md5sums=('d0565d55aeec8a1d6f22b5f6784abdec'
         '486811f03f175ed0147de18638c5d0cf')
build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < ../arch.patch || return 1
  make DESTDIR=${startdir}/pkg install-daemon || return 1
}
