#Maintainer: kiefer <jorgelmadrid@gmail.com>
#Colaborated: ideal

pkgname=ailurus
pkgver=10.10.3
pkgrel=2
pkgdesc="A simple application installer and GNOME tweaker"
arch=('i686' 'x86_64')
license=('GPLv2')
url="http://code.google.com/p/ailurus/"
depends=('dbus-python' 'polkit-gnome' 'python-distutils-extra' 'python-gnomekeyring' 'python-notify' 'unzip' 'vte' 'xterm')
optdepends=("polkit-kde: for KDE integration")
source=("http://$pkgname.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('41b5c618e2ddadbeb2f454a9b822229d')

build() {
       cd $srcdir/$pkgname-$pkgver
       python2 setup.py install --root=$pkgdir/ --optimize=1 || return 1
}
