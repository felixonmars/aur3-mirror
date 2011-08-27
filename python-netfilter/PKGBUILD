# Maintainer: Ricardo 'richerVE' Hernández <richerve«at»archlinux.com.ve> 
# Contributor: Ricardo 'richerVE' Hernández <richerve«at»archlinux.com.ve> 
pkgname=python-netfilter
pkgver=0.5.6
pkgrel=1
pkgdesc="python-netfilter is a set of modules for the Python programming language which allows you to manipulate netfilter rules."
arch=('i686' 'x86_64')
url="http://opensource.bolloretelecom.eu/projects/python-netfilter/"
license=('GPLv3')
depends=('python')
source=(http://opensource.bolloretelecom.eu/files/$pkgname-$pkgver.tar.gz)
md5sums=('63c66abc6d4bdf9cb43b0ffe20d71811')

build() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --root=$pkgdir || return 1
}
