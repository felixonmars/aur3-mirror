# Maintainer: Josh VanderLinden <arch@cloudlery.com>
# Based on Sirat18's impacket PKGBUILD
pkgname=impacket-svn
pkgver=728
pkgrel=1
pkgdesc="Network protocols Constructors and Dissectors"
arch=('i686' 'x86_64')
url="http://oss.coresecurity.com/projects/impacket.html"
license='APACHE'
depends=('python2' 'pycrypto')
optdepends=('pcapy: traffic sniffing example programs')
makedepends=('subversion')
conflicts=('impacket')

_svntrunk=http://impacket.googlecode.com/svn/trunk/
_svnmod=${pkgname}

build() {
  cd ${srcdir}
  msg "Connecting to SVN server..."


  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "${pkgver}")
  else
    svn co "${_svntrunk}" --config-dir ./ -r "${pkgver}" "${_svnmod}"
  fi

  msg "SVN Checkout done or server timeout"
  msg "Starting build..."

  rm -rf "${srcdir}/${_svnmod}-build"
  svn export "${srcdir}/${_svnmod}" "${srcdir}/${_svnmod}-build"
  cd "${srcdir}/${_svnmod}-build"
}

package() {
  cd "${srcdir}/${_svnmod}-build"
  python2 setup.py install --root="${pkgdir}/" --optimize=1 || return 1
  install -D LICENSE ${pkgdir}/usr/share/licenses/impacket/LICENSE
}

# vim:set ts=2 sw=2 et:
