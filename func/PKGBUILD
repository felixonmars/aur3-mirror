# Contributor: Thomas S Hatch <thatch45@gmail.com>

pkgname=func
pkgver=0.27
pkgrel=6
pkgdesc="Fedora Unified Network Controller"
arch=(any)
url="https://fedorahosted.org/func/"
license=("GPL2")
depends=('python2' 'certmaster' 'pyopenssl')
makedepends=()
optdepends=()
options=()
source=("https://fedorahosted.org/releases/f/u/func/${pkgname}-${pkgver}.tar.gz"
        "funcd"
        "python_27.patch")
md5sums=('27e6b4613906894d738c323f5e9af476'
         '538318fed462dc1c7e02480decc94b24'
         '0a1d12d11c3e85f6f9438cc9711cc5f1')

build() {
  cd ${srcdir}
  patch -p0 < python_27.patch
}
        
package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  python2 setup.py install --root=${pkgdir}/ --optimize=1
  install -m 755 -D ${srcdir}/funcd ${pkgdir}/etc/rc.d/funcd
  rm -rf ${pkgdir}/etc/init.d
}
