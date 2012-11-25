# Author: Aliaksandr Stelmachonak <mail.avatar at gmail.com>

pkgname=pydialer
pkgver=0.6.1
pkgrel=2
pkgdesc="A simple and handy frontend for WvDial written in Python, fork of pyWvDial"
arch=('i686' 'x86_64')
url="http://code.google.com/p/pydialer"
depends=('python2' 'wvdial' 'pygtk' 'python2-notify')
license=('GPL')
source=(http://pydialer.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('63480feb80a307e2ac3c7c91ca2b4912')

build(){
    cd $srcdir/$pkgname-$pkgver
    python2 setup.py install --prefix=/usr --root=$pkgdir || return 1
}
