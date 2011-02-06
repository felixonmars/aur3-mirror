# Contributor: Stiletto <blasux@blasux.ru>
pkgname=gnome-kerberos
pkgver=0.3.3
pkgrel=1
pkgdesc="Kerberos tickets management utility."
arch=("i686")
license=("GPL2")
url="http://cvs.fedoraproject.org/repo/dist/gnome-kerberos/gnome-kerberos-0.3.3.tar.gz/9e74c1568c7dc56d3837e9bfbfa07ed6/gnome-kerberos-0.3.3.tar.gz"
depends=('libgnomeui' 'mit-krb5')
makedepends=('gettext' 'intltool' 'pkgconfig' 'mit-krb5')
source=(http://cvs.fedoraproject.org/repo/dist/gnome-kerberos/gnome-kerberos-0.3.3.tar.gz/9e74c1568c7dc56d3837e9bfbfa07ed6/gnome-kerberos-0.3.3.tar.gz)
md5sums=(9e74c1568c7dc56d3837e9bfbfa07ed6)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --with-krb5=/opt/mit-krb5
  sed -i 's!/opt/mit-krb5/\.!/opt/mit-krb5/lib!' Makefile
  sed -i 's!/opt/mit-krb5/\.!/opt/mit-krb5/lib!' src/Makefile
  make || return 1
  make DESTDIR=$startdir/pkg install
  mv $startdir/pkg/usr/bin/krb5 $startdir/pkg/usr/bin/krb5.real
  cat  > $startdir/pkg/usr/bin/krb5 <<EOF
#!/bin/sh
LD_LIBRARY_PATH=/opt/mit-krb5/lib \$0.real
EOF
  chmod 755 $startdir/pkg/usr/bin/krb5
}
