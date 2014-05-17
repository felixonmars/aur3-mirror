pkgname=ginn-ubuntu
pkgver=0.2.6
pkgrel=3
pkgdesc="A deamon with jinn-like wish-granting capabilities"
url="http://launchpad.net/ginn"
arch=('x86_64')
license=('GPL')
depends=('geis' 'bamf' 'libxtst')
source=('http://mirrors.kernel.org/ubuntu/pool/universe/g/ginn/ginn_0.2.6-0ubuntu5_amd64.deb')
conflicts=('ginn')
optdepends=('xf86-input-mtrack-git' 'easystroke')
md5sums=('SKIP')

package() {
  tar zxvf ${srcdir}/data.tar.gz -C ${pkgdir}/
}
