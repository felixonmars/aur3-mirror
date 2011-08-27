# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr> 

pkgname=captcha
pkgver=0.1
pkgrel=2
pkgdesc="Simple Captcha image generator"
arch=('i686' 'x86_64')
url='http://www.greyc.ensicaen.fr/~dtschump/captcha/'
license=('custom:"CeCILL"')
depends=('gcc-libs')
source=('http://www.greyc.ensicaen.fr/~dtschump/captcha.zip')
md5sums=('bb747dd1ab45fa7eaf5022b9324cd0c2')


build() {
  cd $srcdir/$pkgname
  make mlinux || return 1
  install -D captcha $pkgdir/usr/bin/captcha
  install -D Licence_CeCILL_V2-en.txt $pkgdir/usr/share/licenses/captcha/COPYING
}
