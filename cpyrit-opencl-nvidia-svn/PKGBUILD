# Mantainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# contributor: Hoàng Đức Hiếu <hdh@lazny.tang.la>
# Contributor: Gilfran Ribeiro <contato [at] gilfran [dot] net>
# Contributor: William Díaz <wdiaz [at] archlinux [dot] us>


pkgname=cpyrit-opencl-nvidia-svn
pkgver=308
pkgrel=5
pkgdesc="OpenCL backend for accelerated attack against WPA-PSK authentication, development version (for NVIDIA users)"
url="http://code.google.com/p/pyrit/"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('python2' 'pyrit-svn' 'libcl')
makedepends=('cuda-toolkit>=4.0.17-2')
conflicts=('cpyrit-opencl-svn')

_svntrunk=http://pyrit.googlecode.com/svn/trunk
_svnmod=cpyrit_opencl

build() {
  svn co ${_svntrunk}/${_svnmod}

  cd ${_svnmod}

  sed -i 's|/usr/local/opencl/OpenCL/common/inc|/usr/include/CL|g' setup.py
  python2 setup.py build
}

package() {
  cd ${srcdir}/${_svnmod}
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
