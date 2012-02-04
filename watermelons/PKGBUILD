# Contributor:	Anton Bazhenov	<gmail.com: anton.bazhenov>
# Contributor:	Chris Mortimore	<gmail.com:chris.mortimore>
# Maintainer:	Jesse Jaara	<gmail.com/mail.ru: jesse.jaara>

pkgname=watermelons
pkgver=1.1.1
pkgrel=7
pkgdesc="An arcade game where you try to keep the falling watermelons in the air"
arch=('any')
url="http://www.imitationpickles.org/melons/"
license=('GPL')
depends=('python-pygame')
source=(http://www.imitationpickles.org/${pkgname/water/}/${pkgname/water/}.tgz
        ${pkgname}.sh)

package() {
  cd "${srcdir}/melons"

  # fix 'high scores' file's path
  sed -i "s_melons.hs_/var/lib/${pkgname}/melons.hs_" main.py

  # install python files and data
  rm -f setup.py
  install -m755 -d "${pkgdir}"/usr/share/${pkgname}{,/data,/pgu}
  install -m644 -t "${pkgdir}"/usr/share/${pkgname} *.py
  install -m644 -t "${pkgdir}"/usr/share/${pkgname}/data data/*
  install -m644 -t "${pkgdir}"/usr/share/${pkgname}/pgu pgu/*

  # install launcher
  install -Dm755 ../${pkgname}.sh "${pkgdir}"/usr/bin/$pkgname

  # install 'high scores' file
  touch melons.hs
  install -Dm666 melons.hs "${pkgdir}"/var/lib/${pkgname}/melons.hs
}
md5sums=('aab2dad48d406063e35ab70c3b7109ac'
         '3c17a9c35901f148876829088c34249c')
