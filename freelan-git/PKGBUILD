# Maintainer: Luke <gaming4jc2@yahoo.com> GPG: E6C7793E
pkgname=freelan-git
_pkgname=freelan
pkgver=20150328
[ "1" = "1" ] && pkgver=`date +"%Y%m%d"`
pkgrel=1
pkgdesc="Latest git of Freelan (binary named freelan2): A peer-to-peer, secure, easy-to-setup, multi-platform, open-source, highly-configurable VPN software."
arch=('i686' 'x86_64')
url="http://freelan.org/"
license=('GPL3')
depends=('boost-libs' 'curl' 'openssl' 'scons' 'python2-setuptools')
makedepends=('boost' 'git' 'python2')
source=("git://github.com/freelan-developers/freelan-all.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/${_pkgname}-all"
    scons # all --mode=debug  ## Uncoment this to build a debug release
}

package() {
 #make folders for packaging
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/etc/freelan2/
  mkdir -p ${pkgdir}/usr/share/licenses/freelan2/
  #go into binary folder and copy binary to /usr/bin
  cd "$srcdir/${_pkgname}-all/install/bin/"
  install -m 755 "freelan2" ${pkgdir}/usr/bin
  #go into configuration folder and copy configuration to /etc/freelan2
  cd "$srcdir/${_pkgname}-all/apps/freelan/config/"
  install -m 644 "freelan.cfg" ${pkgdir}/etc/freelan2/
  #go into main package folder and copy LICENSE file to appropriate location...
  cd "$srcdir/${_pkgname}-all/"
  install -m 644 "LICENSE" ${pkgdir}/usr/share/licenses/freelan2/LICENSE
}
