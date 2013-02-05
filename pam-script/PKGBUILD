# Contributor: bender02 at archlinux dot us
pkgname=pam-script
pkgver=1.1.6
pkgrel=1
pkgdesc="PAM module which allows you to execute scripts during authorization, password changes and sessions."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/pam-script/"
license=('GPL2')
depends=('pam')
source=(http://sourceforge.net/projects/$pkgname/files/$pkgname-$pkgver.tar.gz)
md5sums=('99a1f03078926096cddc73bd17462eb0')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/etc \
        --sysconfdir=/etc/pam-script \
        --datarootdir=/usr/share \
        --libdir=/usr/lib/security
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" install-examples

  # the default symlinks don't work:
  rm $pkgdir/etc/pam-script/pam_script_*
}
