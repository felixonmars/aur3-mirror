# Contributor: Matej Horváth <matej.horvath@gmail.com>
# Contributor: Antony Jepson <antonyat@gmail.com>
# Contributor: Cilyan Olowen <gaknar@gmail.com>

pkgname=gvtray
pkgver=1.1
pkgrel=6
pkgdesc="A master volume mixer in the system tray"
arch=("i686" "x86_64")
url="http://code.google.com/p/gtk-tray-utils/"
license=("GPL")
depends=('gnome-python-extras' 'python-pyalsaaudio')
source=(http://gtk-tray-utils.googlecode.com/svn/trunk/$pkgname-$pkgver.tar.gz
        python2.patch)
md5sums=('16f3c295562e965708655c3bd732bd39'
         'cdb4e58f054ed386f420eb82c71267b7')

build() {
  install -d ${pkgdir}/usr/share/$pkgname/gvtray_about
  install -d ${pkgdir}/usr/bin
  cd ${srcdir}/$pkgname-$pkgver
  patch -p0 -i ../python2.patch
  install -m 0755 gvtray ${pkgdir}/usr/bin/
  install -m 0755 gvtray.py ${pkgdir}/usr/share/$pkgname/
  install -m 0644 gvtray_about/* ${pkgdir}/usr/share/$pkgname/gvtray_about
}
