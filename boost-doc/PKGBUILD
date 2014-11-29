# Maintainer: Tianjiao Yin <ytj000+aur@gmail.com>

pkgname=boost-doc
pkgver=1.57.0
pkgdesc="Documentation of Boost, a free peer-reviewed portable C++ source libraries."
_boostver=${pkgver//./_}
pkgrel=2
arch=("any")
url="http://www.boost.org/"
makedepends=('python')
license=('custom')
options=('!strip')
source=(http://downloads.sourceforge.net/project/boost/boost/${pkgver}/boost_${_boostver}.tar.bz2) 

build() {

  cd ${srcdir}
  python << EOF
# remove all files which ext name not in exts and "example" is not appear in the path.
import os, os.path
exts = {'.png', '.gif', '.bmp', '.jpg', '.jpeg', '.htm', '.html', '.css'}

for parent, dirnames, filenames in os.walk('.', topdown = False):
    for filename in filenames:
        if os.path.splitext(filename)[1].lower() not in exts and "example" not in parent.lower():
            os.remove(os.path.join(parent, filename))
    for dirname in dirnames:
        path = os.path.join(parent, dirname)
        try:
            os.rmdir(path)
        except OSError:
            pass
EOF
  find -type d -exec chmod 755 {} \;
  find -type f -exec chmod 644 {} \;
}

package() {
  mkdir -p ${pkgdir}/usr/share/doc/boost
  mv "${srcdir}/boost_${_boostver}" ${pkgdir}/usr/share/doc/boost/en
}

md5sums=('1be49befbdd9a5ce9def2983ba3e7b76')
