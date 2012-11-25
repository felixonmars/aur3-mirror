#Maintainer: kiefer <jorgelmadrid@gmail.com>
#Colaborated: ideal

pkgname=ailurus
pkgver=12.08
pkgrel=1
pkgdesc="A tool for backup a name list of installed software"
arch=('any')
license=('GPLv2')
url="http://code.google.com/p/ailurus/"
depends=('python2-dbus'  'polkit-gnome' 'python2-gnomekeyring' 'python2-notify' 'unzip' 'vte' 'xterm')
makedepends=('desktop-file-utils' 'python2-distutils-extra')
optdepends=("polkit-kde: for KDE integration")
source=("http://ailurus.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('124e6e6ad1fd11eedfa1664ae242d437')

build() {
       cd $srcdir/$pkgname-$pkgver
       python2 setup.py install --root=$pkgdir/ --optimize=1 || return 1
}
