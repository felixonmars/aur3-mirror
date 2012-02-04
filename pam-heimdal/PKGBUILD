# Maintainer: Uwe L. Korn <uwelk@xhochy.com>
# Contributor: Uwe L. Korn <uwelk@xhochy.com>

pkgname=pam-heimdal
pkgver=4.4
pkgrel=2
pkgdesc='A PAM module providing Kerberos v5 support using heimdal.'
arch=('i686' 'x86_64')
url='http://www.eyrie.org/~eagle/software/pam-krb5/'
license=('custom')
options=('!libtool')
depends=('heimdal-aur' 'pam')
conflicts=('pam-krb5')
source=("http://archives.eyrie.org/software/kerberos/pam-krb5-$pkgver.tar.gz")
md5sums=('a3f9a414fef102cd815a763c965b315c')

build() {
  cd "${srcdir}/pam-krb5-${pkgver}"
  ./configure --prefix=/usr \
    --enable-reduced-depends \
    --with-krb5=/opt/heimdal/ \
    --with-krb5-include=/usr/heimdal/include \
    --with-krb5-lib=/usr/heimdal/lib/
  make
}

package() {
  cd "${srcdir}/pam-krb5-${pkgver}"
  make DESTDIR=$pkgdir install
  mv $pkgdir/lib/security/pam_krb5.so $pkgdir/lib/security/pam_heimdal.so
  mv $pkgdir/usr/share/man/man5/pam_krb5.5 $pkgdir/usr/share/man/man5/pam_heimdal.5
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
