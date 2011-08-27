# Maintainer: Myles English <myles at rockhead dot biz>
# Contributor: DarkHeart <fumbles@ymail.com>
pkgname=instant-fenics
_pkgname=instant
pkgver=0.9.10
pkgrel=1
pkgdesc="A Python module allowing for instant inlining of C and C++ code in Python"
arch=('any')
url="http://launchpad.net/instant"
license=('BSD')
groups=('fenics')
_patchname="patch.diff"
depends=('python2' 'swig')
conflicts=('instant')
source=(http://launchpad.net/instant/trunk/${pkgver}/+download/$_pkgname-$pkgver.tar.gz
        patch.diff)
md5sums=('1493dcb34205717559c100964e219d2f'
         '8445ffdaabc8645d93310e34cf6a9170')

build() {
  cd $srcdir/$_pkgname-$pkgver
  patch -Np1 -i ${startdir}/${_patchname}
  find ${srcdir} -name "*" -type f -exec \
      sed -i 's#\(/usr/bin/env \|/usr/bin/\)python[2-3]*#\1python2#' {} \;

  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}

# vim:set ts=2 sw=2 et:
