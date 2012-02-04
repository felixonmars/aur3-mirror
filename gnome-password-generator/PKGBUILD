# Contributor: lp76 <l.peduto@gmail.com>
pkgname=gnome-password-generator
pkgver=1.6
pkgrel=2
pkgdesc="A GUI based secure password generator"
arch=('i686' 'x86_64')
url="http://gnome-password.sourceforge.net/"
license=('GPL')
depends=('python' 'pygtk' 'gnome-python')
source=(http://downloads.sourceforge.net/project/gnome-password/Gnome%20Password%20Generator/$pkgver/gnome-password-generator-$pkgver.tar.gz)
md5sums=('6d7f49639e64028c2eee733c0be735ec')

build() {
  cd $srcdir/$pkgname-$pkgver
  make || return 1
  make DESTDIR=$pkgdir install || return 1

  sed -i 's|/usr/bin/python|/usr/bin/python2|' $pkgdir/usr/bin/gnome-password-generator
}
