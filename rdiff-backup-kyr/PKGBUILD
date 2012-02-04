# Maintainer: Corali Signs Co. <coralisigns[AT]gmail[DOT]com>
pkgname=rdiff-backup-kyr
_pkgname=${pkgname%-*}
pkgver=1.2.8
pkgrel=2
pkgdesc='A utility for local/remote mirroring and incremental backups'
arch=('i686' 'x86_64')
url='http://www.nongnu.org/rdiff-backup/'
license=('GPL')
depends=('python2' 'librsync')
optdepends=('pylibacl: access control list support'
            'pyxattr: extended attribute support')
provides=('rdiff-backup')
conflicts=('rdiff-backup')
source=("http://savannah.nongnu.org/download/$_pkgname/$_pkgname-$pkgver.tar.gz" 'socket.patch')
md5sums=('1a94dc537fcf74d6a3a80bd27808e77b' '286df1f1b619397937a143965505e4bd')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  patch -p1 <../socket.patch
  python2 setup.py install --root="$pkgdir" -O1|| return 1

  # Fix for FS#18848
  sed -i 's|python2|python2 -W ignore::DeprecationWarning|' ${pkgdir}/usr/bin/rdiff-backup
}
