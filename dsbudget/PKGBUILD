# Contributor: Richard Murri <admin@richardmurri.com>
pkgname=dsbudget
pkgver=2.0.21a
pkgrel=1
pkgdesc="very simple budgeting application"
arch=(any)
url="http://sites.google.com/site/dsbudgethome/"
license=('GPL')
install=dsbudget.install
source=(http://dsbudget.googlecode.com/files/${pkgname}_${pkgver}.tar.gz)
backup=(opt/dsbudget/BudgetDocument.xml opt/dsbudget/dsbudget.conf)
md5sums=('7323e49b61603df03a0fc3826c80eb32')

build() {
  cd "$srcdir/$pkgname"

  # install files
  install -d $pkgdir/opt/dsbudget
  install dsbudget.conf $pkgdir/opt/dsbudget/
  install dsbudget.jar $pkgdir/opt/dsbudget/
  install BudgetDocument.xml $pkgdir/opt/dsbudget/

  cp -r tomcat $pkgdir/opt/dsbudget/

  # add to /usr/bin
  echo "cd /opt/dsbudget" > temp
  cat run.sh >> temp
  install -Dm 555 temp $pkgdir/usr/bin/dsbudget
}



