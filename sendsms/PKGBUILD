#Contributor: yetist <yetist@gmail.com>

pkgname=sendsms
pkgver=0.1
pkgrel=1
pkgdesc="sendsms, Using CHINA MOBILE's Fetion Protocol "
arch=('i686' 'x86_64')
url="http://www.solrex.cn/" 
license=('GPL')
depends=("curl")
makedepends=('gcc')
source=(http://share.solrex.cn/program/$pkgname.tar.bz2)
md5sums=('40bf073084d0aadf2e98a13ee8603c87')

build() { 
  cd $srcdir/$pkgname
  make || return 1

  install -Dm755 sendsms  ${pkgdir}/usr/bin/sendsms
}
