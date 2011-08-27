# Maintainer: Pierre Chiche < pierre [dot] chiche [at] gmail [dot] com
pkgname=wosoggie
pkgver=0.1.11
pkgrel=3
pkgdesc="Next-generation client for the collaborative rendering farm Corefarm.org"
arch=('i686' 'x86_64')
url="http://www.corefarm.org/"
license=('unknown')
depends=()
source=(http://www.corefarm.org/${pkgname}/${pkgname}-${pkgver}.tar.gz http://www.corefarm.org/${pkgname}/public_key wosoggie)
md5sums=('fa067a42bba2b3d98d889fc91780e7d4'
         '5c6a422d173d879060aa80a81e5cf1cf'
         'ed0e11d729923adccc9bcf12d444f7bb')

build() {
  install -Dm755 ${srcdir}/wosoggie ${pkgdir}/usr/bin/wosoggie
  install -Dm644 public_key ${pkgdir}/usr/share/wosoggie/public_key
  cd ${srcdir}/${pkgname}_${pkgver}

  install -Dm755 node ${pkgdir}/usr/share/wosoggie/wosoggie-node
  install -Dm644 sel_ldr ${pkgdir}/usr/share/wosoggie/sel_ldr

  sed 's|/your_wosoggie_path/launcher/|/usr/share/wosoggie/launcher/|' -i wosoggie.xml
  sed 's|/home/leferran/task_key_public|/usr/share/wosoggie/public_key|' -i wosoggie.xml
  install -Dm644 wosoggie.xml ${pkgdir}/etc/wosoggie/wosoggie.xml

  cp -r launcher/ ${pkgdir}/usr/share/wosoggie/
  cp README ${pkgdir}/usr/share/wosoggie/
}
