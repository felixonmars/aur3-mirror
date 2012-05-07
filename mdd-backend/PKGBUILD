# Maintainer: Juho Rutila <juho.rutila@iki.fi>
pkgname=mdd-backend
_pkgname=mdd
pkgver=0.5.3
pkgrel=1
pkgdesc="MythDroid Daemon for MythTV backends"
arch=(any)
url="http://code.google.com/p/mythdroid/"
license=('unknown')
groups=()
depends=('perl' 'mythtv' 'perl-image-imlib2')
makedepends=()
install=mdd.install
provides=(mdd)
conflicts=(mdd-frontend)
source=(
  http://mythdroid.googlecode.com/files/$_pkgname-$pkgver.tgz
  mdd.install
  mdd.rc
  )

md5sums=('1914680595f97bf3f2853a45c1310643'
         'bc65d609188ddab0f148fed16da57443'
         'f33c20f713fb74ba3aa6b5a46b3af973')

build() {
  cd "$srcdir/$_pkgname"

  yes n | perl Build.PL installdirs=vendor destdir="$pkgdir"
  #./Build test
}

package() {
  mkdir -p $pkgdir/etc/rc.d
  mkdir -p $pkgdir/var/lib/mdd/.mythtv
  install mdd.rc $pkgdir/etc/rc.d/mdd
  cd "$srcdir/$_pkgname"

  ./Build install
}

# vim:set ts=2 sw=2 et:
