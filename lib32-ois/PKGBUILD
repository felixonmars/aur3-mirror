# Maintainer: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Dan Vratil <dan@progdan.cz>

_pkgbase=ois
pkgname=lib32-$_pkgbase
pkgver=1.3
_oisver=1-3
pkgrel=4
pkgdesc="Object Oriented Input System (32 bit)"
arch=('x86_64')
url="http://sourceforge.net/projects/wgois"
license=('custom')
depends=('lib32-libx11' 'lib32-gcc-libs' "${_pkgbase}")
makedepends=('lib32-libltdl' 'gcc-multilib' 'lib32-libxaw')
options=('!libtool')
source=("http://downloads.sourceforge.net/project/wgois/Source%20Release/${pkgver}/ois_v${_oisver}.tar.gz"
        'gcc47.diff' 'LICENSE')
md5sums=('9697fead17eac6025151cd2e1fca1518'
         '29f6942ed92a96edc6c7a07218acc341'
         'a03443907a68f1878ee55002a4e00c39')

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  
  cd ${_pkgbase}-v${_oisver}
  
  # https://sourceforge.net/tracker/?func=detail&aid=3515396&group_id=149835&atid=775955
  patch -p1 -i ../gcc47.diff
  
  chmod +x bootstrap
  ./bootstrap
  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

package() {
  make -C ${_pkgbase}-v${_oisver} DESTDIR="${pkgdir}" install
  rm -rf ${pkgdir}/usr/include
  
  install -dm755 "${pkgdir}"/usr/share/licenses/
  ln -s ${_pkgbase} "${pkgdir}"/usr/share/licenses/${pkgname}
}
