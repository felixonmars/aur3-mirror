# Maintainer: Stefano Galeazzi <stefano dot galeazzi at probanet dot it>

pkgname=mod_auth_kerb_apache24
pkgreal=mod_auth_kerb
pkgver=5.4
pkgrel=6
pkgdesc="A Kerberos authentication module for the Apache 2.4 HTTP Server"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/modauthkerb/files/mod_auth_kerb/mod_auth_kerb-5.4/mod_auth_kerb-5.4.tar.gz/download"
license=('custom')
groups=()
depends=('apache>=2.4' 'krb5')
makedepends=()
optdepends=()
conflicts=()
replaces=()
options=()
install=
source=(http://downloads.sourceforge.net/project/modauthkerb/$pkgreal/$pkgreal-$pkgver/$pkgreal-$pkgver.tar.gz http://sourceforge.net/p/modauthkerb/patches/_discuss/thread/418c3b51/739d/attachment/$pkgreal-$pkgver-apache24.patch auth_kerb.conf)
noextract=()
md5sums=('642b81763ad3ca81dba359cb952da5e3'
         '7235e27d568d9ab8d647fe769934aa92'
         '399f8ab44947ac79f23f718c4ca9a527')

package() {
     cd $startdir/src/$pkgreal-$pkgver
     patch -p0 < $startdir/$pkgreal-$pkgver-apache24.patch
     ./configure --without-krb4 --with-apache=$pkgdir

     mkdir -p $pkgdir/usr/lib/httpd/modules
     mkdir -p $pkgdir/etc/httpd/conf/extra
     mkdir -p $pkgdir/usr/share/licenses/$pkgreal/

     make || return 1
     install -m 755 src/.libs/$pkgreal.so $pkgdir/usr/lib/httpd/modules || return 1
     install -m 644 $startdir/src/auth_kerb.conf $pkgdir/etc/httpd/conf/extra/auth_kerb.conf.sample || return 1
     install -m 644 LICENSE $pkgdir/usr/share/licenses/$pkgreal/ || return 1
}
