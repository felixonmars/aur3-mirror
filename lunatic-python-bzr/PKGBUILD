# Maintainer: alorewotik <paraparapampam@gmail.com>

pkgname=lunatic-python-bzr
pkgver=10
pkgrel=3
pkgdesc="Bidirectional Lua-Python bridge"
url="http://labix.org/lunatic-python"
arch=('i686' 'x86_64')
license="GPL"
depends=('python2' 'lua')
makedepends=('bzr')
source=(1-pep-353.patch
        2-del-segfault.patch
        3-subscript-panic.patch)
md5sums=('b03c9d0c13c01a7564b03d2a1858f836'
         '6ec24030166a7a6493b4a65faaeb4256'
         'a5cd7207f5893fc84446760fa7b0ccca')
_bzrbranch=lp:~hircus/lunatic-python
_bzrmod=trunk

build()
{
  cd "${srcdir}"

  msg "Connecting to the server...."

  if [ -d $_bzrmod ] ; then
    cd $_bzrmod && bzr pull -q
    msg "The local files are updated."
  else
    bzr branch $_bzrbranch/$_bzrmod -q
  fi

  msg "BZR checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${_bzrmod}-build
  cp -r ${_bzrmod} ${_bzrmod}-build
  cd ${_bzrmod}-build

  for _patch in "${srcdir}"/*.patch ; do
    patch -Np0 -i "${_patch}"
  done
#  patch -Np0 -i "${srcdir}/pep353.patch"
#  patch -Np0 -i "${srcdir}/del-segfault.patch"
#  patch -Np0 -i "${srcdir}/subscript-panic.patch"
  python2 setup.py build
  python2 setup.py install -O1 --skip-build --prefix="${pkgdir}"/usr
}

package()
{
  install -D -m644 "${pkgdir}"/usr/lib/{python2.7/site-packages/python.so,lua/5.1/python.so}

  cd "${srcdir}/${_bzrmod}-build"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
