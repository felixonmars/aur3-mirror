#Maintainer: kiefer <jorgelmadrid@gmail.com>
#Colaborated: ideal

pkgname=ailurus
pkgver=10.10.3
pkgrel=3
pkgdesc="A simple application installer and GNOME tweaker"
arch=('any')
license=('GPLv2')
url="http://code.google.com/p/ailurus/"
depends=('dbus-python' 'polkit-gnome' 'python-gnomekeyring' 'python-notify' 'unzip' 'vte' 'xterm')
makedepends=('python-distutils-extra')
optdepends=("polkit-kde: for KDE integration")
source=("http://dl.dropbox.com/u/162810/$pkgname-$pkgver.tar.xz")
md5sums=('54957f09ac41760a69c1b93b41cae9e6')

build() {
       cd $srcdir/$pkgname-$pkgver
       python2 setup.py install --root=$pkgdir/ --optimize=1 || return 1
}
