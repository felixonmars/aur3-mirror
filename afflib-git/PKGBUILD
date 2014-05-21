# Maintainer: Fabio Melo Pfeifer <fmpfeifer@gmail.com>

pkgname=afflib-git
pkgver=3.7.4.r1.g5f0bd98
pkgrel=1
pkgdesc="is an extensible open format for the storage of disk images and related forensic information."
arch=('i686' 'x86_64')
url="https://github.com/simsong/AFFLIBv3"
license=('custom')
depends=('zlib' 'openssl' 'fuse')
provides=('afflib')
conflicts=('afflib')
_gitname=AFFLIBv3

source=('git+https://github.com/simsong/AFFLIBv3.git')
md5sums=('SKIP')

pkgver() {
    cd $srcdir/$_gitname
    git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}


build() {
  cd ${srcdir}/$_gitname
  sh bootstrap.sh
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd $srcdir/$_gitname
  make DESTDIR=${pkgdir} install
  install -D -m644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
