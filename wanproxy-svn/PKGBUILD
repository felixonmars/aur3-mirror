# Maintainer: kurych <kurych[at]mail[dot]ru>
pkgname=wanproxy-svn
_pkgname=wanproxy
pkgver=20140221.1434
pkgrel=1
pkgdesc="Portable TCP proxy which makes TCP connections send less data, which improves TCP performance and throughput over lossy links, slow links and long links"
arch=('i686' 'x86_64')
url="http://wanproxy.org/"
license=('BSD')
makedepends=('subversion')
#options=()
backup=('etc/wanproxy/wanproxy.conf' 'etc/conf.d/wanproxy')
source=("${_pkgname}::svn+http://wanproxy.org/svn/trunk"
        'wanproxy.conf.d'
        'wanproxy.service')
md5sums=('SKIP'
         'a3d57b2758b121b433fcbb6d4d4118b6'
         '04c8b8a251e4a74272d6029c2885c8b6')

provides=("${_pkgname}")
conflicts=("${_pkgname}")


pkgver() {
  cd "${srcdir}/${_pkgname}"
#  svnversion
  svn info | awk '/Revision/{r=$2}/Date/{gsub(/-/,"");d=$4}END{print d"."r}'
}

build() {

  cd "${srcdir}/${_pkgname}/programs/wanproxy"
  make NDEBUG=1
}

package() {
  install -D -m755 "${srcdir}/${_pkgname}/programs/wanproxy/wanproxy" "${pkgdir}/usr/bin/wanproxy"
  install -D -m644 "${srcdir}/${_pkgname}/programs/wanproxy/wanproxy.conf" "${pkgdir}/etc/wanproxy/wanproxy.conf"
  install -D -m644 "${srcdir}/wanproxy.conf.d" "${pkgdir}/etc/conf.d/wanproxy"
  install -Dm644 "${srcdir}/wanproxy.service" "${pkgdir}/usr/lib/systemd/system/wanproxy.service"
}

# vim:set ts=2 sw=2 et:
