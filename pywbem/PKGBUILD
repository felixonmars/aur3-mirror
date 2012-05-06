# Contributor: Thore Bunde <root[at]netpimp.de> 
pkgname=pywbem
pkgver=0.7.0
pkgrel=2
pkgdesc="Python WBEM Client and Provider Interface" 
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/pywbem/"
license=('GNU')
depends=('python2')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/${pkgname}-${pkgver}.tar.gz)
md5sums=('f005a1862ea69b83f7c356552361f54d')
options=('!libtool')

build() {
  cd $srcdir/$pkgname-$pkgver
    python2 setup.py build || return 1
    python2 setup.py install --root=$pkgdir || return 1

}
