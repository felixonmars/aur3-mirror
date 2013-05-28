# Contributor:  <mathieui@mathieui.net>
pkgname=uligo
pkgver=0.3
_pkgver=03
pkgrel=2
pkgdesc='uliGo is a program to practice solving go problems. '
arch="any"
url="http://www.u-go.net/uligo/"
license='GPL'
depends=('python2')
conflicts='uligo-hg'
source=("http://dl.u-go.net/$pkgname/download/$pkgname$_pkgver.tar.gz")
md5sums=('ea17c666accaaf36441626e25ff07264')

package() {
  cd "${srcdir}/${pkgname}${_pkgver}"
  for _i in $(ls *.py)
  do
      sed -i "s#whrandom#random#g" $_i
  done
  mkdir -p $pkgdir/usr/share/$pkgname
  mkdir -p $pkgdir/usr/bin
  cp -R ./* $pkgdir/usr/share/$pkgname
  echo -e '#!/bin/bash'"\ncd /usr/share/$pkgname\npython2 $pkgname.py" > $pkgdir/usr/bin/$pkgname
  chmod +x $pkgdir/usr/bin/$pkgname
}
