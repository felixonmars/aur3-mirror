#Contributor: Sven Kauber <celeon@gmail.com>
#Maintainer: Ray Kohler <ataraxia937@gmail.com>
pkgname=krb5-crypto
pkgver=1.7
pkgrel=1
pkgdesc="The crypto part of Kerberos"
url="http://web.mit.edu/kerberos/www/#what_is"
license="Kerberos-license"
arch=('i686' 'x86_64')
depends=('glibc')
makedepends=('bison')
source=(http://web.mit.edu/kerberos/www/dist/krb5/1.7/krb5-${pkgver}-signed.tar
        license)
md5sums=('9f7b3402b4731a7fa543db193bf1b564' '8d6cb4c10e939c240b07b7ed59a9e87d')

build()
{
  cd $startdir/src
  tar zxf krb5-$pkgver.tar.gz
  cd $startdir/src/krb5-$pkgver/src
  ./configure --prefix=/usr
  make || return 1
  install -Dm644 lib/crypto/libk5crypto.so.3.1 $startdir/pkg/usr/lib/libk5crypto.so.3.1
  install -Dm644 lib/libkrb5support.so.0.1 $startdir/pkg/usr/lib/libkrb5support.so.0.1
  install -Dm644 $startdir/license $startdir/pkg/usr/share/licenses/$pkgname/Kerberos-license
  ln -s /usr/lib/libkrb5support.so.0.1 $startdir/pkg/usr/lib/libkrb5support.so.0
  ln -s /usr/lib/libkrb5support.so.0 $startdir/pkg/usr/lib/libkrb5support.so
  ln -s /usr/lib/libk5crypto.so.3.1 $startdir/pkg/usr/lib/libk5crypto.so.3
  ln -s /usr/lib/libk5crypto.so.3 $startdir/pkg/usr/lib/libk5crypto.so
}
