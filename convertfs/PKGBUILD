# Contributor: Michael P <ptchinster@archlinux.us >
# Contributor: Fernando Henrique < arch at liquuid dot net >
# Contributor: Stefano Zamprogno <stefano.zamprogno@gmail.com>

pkgname=convertfs
pkgver=20050113
pkgrel=8
pkgdesc="Convert a filesystem to another type of filesystem (eg. ext3 to xfs)"
url="http://tzukanov.narod.ru/convertfs/"
license="GPL"
depends=('glibc')
arch=('i686' 'x86_64')
source=(http://tzukanov.narod.ru/${pkgname}/${pkgname}-13jan2005.tar.gz
        convertfs_dumb.patch
        devremap.patch
        convertfs-quote-variables.patch
        convertfs-ftwmv.patch)
md5sums=('71e8065e321898e259a55c8cefdfd75d'
         '6eeb29958b68b8d722ee9865538a1bbe'
         '4c7147a8741e966e22a277a38bfb1601'
         'e5bafd8d23d73052749e509038abaa8a'
         '625be967932767dddfaebe65893641f3')

build() {
  cd $srcdir/$pkgname

  patch -Np1 -i $srcdir/devremap.patch || return 1
  patch -Np1 -i $srcdir/convertfs-ftwmv.patch || return 1

  make || return 1

  patch -Np0 -i $srcdir/convertfs_dumb.patch  || return 1
  patch -Np0 -i $srcdir/convertfs-quote-variables.patch  || return 1

  install -D -m 755 contrib/convertfs $pkgdir/sbin/convertfs  || return 1
  install -D -m 755 convertfs_dumb $pkgdir/sbin/convertfs_dumb  || return 1
  install -D -m 755 devclone $pkgdir/sbin/devclone  || return 1
  install -D -m 755 devremap $pkgdir/sbin/devremap  || return 1
  install -D -m 755 prepindex $pkgdir/sbin/prepindex  || return 1
  install -D -m 755 ftwmv $pkgdir/sbin/ftwmv  || return 1
}
