# Maintainer: Jaydeep Joshi <jaydeepmjoshi@gmail.com> 
pkgname=android-asset-resizer
pkgver=2013.09.29
pkgrel=1
pkgdesc="The Android asset resizer can be used to generate drawable assets from a larger source image."
arch=('any')
url="https://github.com/twaddington/android-asset-resizer"
license=('Apache')
depends=('python2' 'python2-pillow')
makedepends=('git')
source=('git://github.com/twaddington/android-asset-resizer.git')
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git log -1 --format=format:%cd --date=short | sed 's|-|.|g'
}

package() {
    cd "${srcdir}/${pkgname}/bin"
    sed -i 's|#!/usr/bin/python|#!/usr/bin/python2|' aaresize
    cd ../ 
    python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize 1
}


