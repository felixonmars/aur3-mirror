# Contributor: Thomas S Hatch <thatch45@gmail.com>

pkgname=certmaster
pkgver=0.27
pkgrel=6
pkgdesc="Universal certificate manager"
arch=(any)
url="https://fedorahosted.org/certmaster/"
license=("GPL2")
depends=('python2' 'python2-pyopenssl')
makedepends=()
optdepends=()
options=()
source=("https://fedorahosted.org/releases/c/e/$pkgname/$pkgname-$pkgver.tar.gz"
        "certmaster"
        "python_27.patch")
md5sums=('62ca6f6a79be0842a996b355c7c491d2'
         '322cf17dc1dbcef1e0a600556ecc09cf'
         'c41ac4895a71f84d9b688bb45bb4d065')

build() {
  cd $srcdir
  patch -p0 < python_27.patch
}
        
package() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --root=$pkgdir/ --optimize=1
  install -m 755 -D $srcdir/certmaster $pkgdir/etc/rc.d/certmaster
  rm -rf $pkgdir/etc/init.d
}
