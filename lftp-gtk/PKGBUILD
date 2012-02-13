# Contributor: wido <widomaker2k7@gmail.com>

pkgname=lftp-gtk
pkgver=1.5
pkgrel=1
pkgdesc="a graphical interface for lftp"
arch=('any')
url="http://www.lftp-gtk.com/"
license=('GPL2')
depends=('lftp' 'glade' 'pygtk' 'python2')
source=(http://www.lftp-gtk.com/packages/$pkgname-$pkgver.tar lftp-gtk.sh)
md5sums=('3638a5b01617a03a5595c83583da2b39'
         '3132fa4d841765fa9bcf7bad4fa16832')

build() {
  cd "${srcdir}"

  # python2 fix
  for file in $(find . -name '*.py' -print); do
  sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
  sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done

  #install executable
  install -Dm 755 ${srcdir}/lftp-gtk.py ${pkgdir}/usr/share/${pkgname}/lftp-gtk.py
  install -Dm 755 ${srcdir}/kill_process.sh ${pkgdir}/usr/share/${pkgname}/kill_process.sh
  install -Dm 755 ${srcdir}/stop_process.sh ${pkgdir}/usr/share/${pkgname}/stop_process.sh

  install -Dm 755 ${srcdir}/lftp-gtk.sh ${pkgdir}/usr/bin/${pkgname}

  #install glade
  install -Dm 644 ${srcdir}/lftp-gtk.glade ${pkgdir}/usr/share/${pkgname}/lftp-gtk.glade
}
