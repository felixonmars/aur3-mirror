# Maintainer: Juho Rutila <juho.rutila@iki.fi>
pkgname=mdd-frontend
_pkgname=mdd
pkgver=0.5.1
pkgrel=1
pkgdesc="MythDroid Daemon for MythTV frontends"
arch=(any)
url="http://code.google.com/p/mythdroid/"
license=('unknown')
groups=()
depends=('perl' 'mythtv' 'perl-x-osd')
makedepends=()
install=mdd.install
provides=(mdd)
conflicts=(mdd-backend)
source=(
  http://mythdroid.googlecode.com/files/$_pkgname-$pkgver.tgz
  mdd.install
  mdd.rc
  )

md5sums=('4ff275b5c8db64647a4a2aa6f29032b7'
         'bc65d609188ddab0f148fed16da57443'
         'f33c20f713fb74ba3aa6b5a46b3af973')

build() {
  cd "$srcdir/$_pkgname"

  yes y | perl Build.PL installdirs=vendor destdir="$pkgdir"
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
