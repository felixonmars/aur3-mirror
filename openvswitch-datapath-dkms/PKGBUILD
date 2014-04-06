# Maintainer: Lance Chen <cyen0312+aur@gmail.com>

pkgname='openvswitch-datapath-dkms'
pkgver=2.1.0
pkgrel=1
pkgdesc="Openvswitch datapath kernel module"
arch=('i686' 'x86_64')
url="http://openvswitch.org/"
license=('Apache')
install=openvswitch-datapath-dkms.install
depends=('python2' 'dkms')
makedepends=('python2')
source=("http://openvswitch.org/releases/openvswitch-$pkgver.tar.gz"
        "dkms.conf")
md5sums=('7c5861b0ef7f3002c15c61be6f5066f2'
         '6dfb9ec230994864a9da88a7d288a254')

package() {

  cd "openvswitch-${pkgver}"

  install -m755 -d ${pkgdir}/usr/src/${pkgbase}-${pkgver}/
  cp -R --preserve * ${pkgdir}/usr/src/${pkgbase}-${pkgver}/

  sed s/PACKAGE_VERSION\=\"\"/PACKAGE_VERSION\=\"${pkgver}\"/ \
      ${srcdir}/dkms.conf > ${pkgdir}/usr/src/${pkgbase}-${pkgver}/dkms.conf
}

# vim:set sw=2 sts=2 et
