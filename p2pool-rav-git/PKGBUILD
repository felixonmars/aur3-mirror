# Maintainer: gee
# Based on Jason Kölker <jason@koelker.net>'s p2pool package
pkgname=p2pool-rav-git
pkgver=13.3.r264.g27989a6
pkgrel=1
pkgdesc="Peer-to-peer Bitcoin mining pool"
arch=(any)
url="https://github.com/Rav3nPL/p2pool-rav"
license=('GPL3')
depends=('python2' 'twisted' 'nattraverso')
makedepends=('git' 'python2-setuptools')
conflicts=('p2pool' 'p2pool-git')
backup=('etc/p2pool.conf' 'etc/conf.d/p2pool')
install='p2pool.install'
source=('git+https://github.com/Rav3nPL/p2pool-rav.git'
        'p2pool.service' 
        'p2pool.conf' 
        'p2pool.conf.d' 
        'setup.py') 
md5sums=(SKIP
         'd5ada6cfae006850dfc5140d4d57c096'
         'd41d8cd98f00b204e9800998ecf8427e'
         '21b0dc8ee522c3e991a6a33e83c2bdf8'
         '88db04ef5d9ee23d12ff07288d834455')

_gitname=p2pool-rav

pkgver() {
  cd "$srcdir/${_gitname}"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd ${srcdir}/${_gitname}
  msg "Fixing setup.py"
  cp ${srcdir}/setup.py ${srcdir}/${_gitname}
}

package() {
  cd ${srcdir}/${_gitname}
  python2 setup.py install --root=${pkgdir}/ --optimize=1
  mkdir -p ${pkgdir}/usr/share/p2pool
  cp -r web-static ${pkgdir}/usr/share/p2pool

  install -D -m644 ${srcdir}/p2pool.conf ${pkgdir}/etc/p2pool.conf
  install -D -m644 ${srcdir}/p2pool.conf.d ${pkgdir}/etc/conf.d/p2pool
  install -D -m644 ${srcdir}/p2pool.service ${pkgdir}/usr/lib/systemd/system/p2pool.service
}
