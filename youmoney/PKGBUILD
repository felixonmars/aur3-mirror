# Contributor: Bo Wang <sanpi1986@gmail.com>
pkgname=youmoney
pkgver=0.9.5
pkgrel=3
pkgdesc="YouMoney is a opensource personal finance software."
arch=('i686' 'x86_64')
url="http://code.google.com/p/youmoney/"
depends=('python2' 'wxpython')
license=('GPL')
source=(http://youmoney.googlecode.com/files/YouMoney-src-0.9.5.zip)
md5sums=('95d56def875d24ccfe4c69725b7a81f8')

build() {
  cd "$srcdir/YouMoney-src-$pkgver"

  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/YouMoney
  mkdir -p $pkgdir/usr/share/YouMoney/ui
  mkdir -p $pkgdir/usr/share/YouMoney/data
  mkdir -p $pkgdir/usr/share/YouMoney/images
  mkdir -p $pkgdir/usr/share/YouMoney/lang
  mkdir -p $pkgdir/usr/share/applications

  echo "#!/bin/bash" > $pkgdir/usr/bin/youmoney
  echo "/usr/bin/python2 /usr/share/YouMoney/youmoney.py" >> $pkgdir/usr/bin/youmoney
  chmod +x $pkgdir/usr/bin/youmoney

  cp data/category.csv $pkgdir/usr/share/YouMoney/data
  cp *.py $pkgdir/usr/share/YouMoney/
  sed -i 's/^Exec=.*$/Exec=\/usr\/bin\/youmoney/' YouMoney.desktop
  cp YouMoney.desktop $pkgdir/usr/share/YouMoney/
  cp YouMoney.desktop $pkgdir/usr/share/applications/
  cp ui/*.py $pkgdir/usr/share/YouMoney/ui/
  cp -R lang $pkgdir/usr/share/YouMoney/
  cp -R images $pkgdir/usr/share/YouMoney/

}
