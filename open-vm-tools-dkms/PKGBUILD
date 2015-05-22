# Maintainer: Dāvis Mosāns <davispuh at gmail dot com>

pkgname=open-vm-tools-dkms
epoch=6
pkgver=9.10.0
_pkgsubver=2476743
pkgrel=3
pkgdesc='Open Virtual Machine Tools kernel modules (DKMS)'
arch=('i686' 'x86_64')
url='http://open-vm-tools.sourceforge.net/'
license=('GPL2')
conflicts=('open-vm-tools-modules', 'vmware-modules-dkms')

depends=('dkms')
options=('!strip')
optdepends=('open-vm-tools: Open Virtual Machine Tools'
            'linux-headers: Header files for Linux kernel')
install=open-vm-tools-dkms.install

_name='open-vm-tools'
_dirname='stable-9.10.0'
_version="${pkgver}-${_pkgsubver}"
_full_name="${_name}-${_version}"
_dkms_version='2015.01.29'

source=(http://downloads.sourceforge.net/${_name}/${_full_name}.tar.gz
        0001-Fix-vmxnet-module-on-kernels-3.16.patch
        0002-Fix-d_alias-to-d_u.d_alias-for-kernel-3.18.patch
        0003-Fix-f_dentry-msghdr-kernel-3.19.patch
        0004-Support-backing-dev-info-kernel-4.0.patch
        dkms.conf.in)
sha256sums=('e146ad53d744d7793ee72c5271fc49a916613534c14827c227fdaef4b3579c96'
            '6684cf4cd9a492b82b24dff076fbbafef19e59ef969f532ee3da1501136a7c48'
            'e14cbd10ccdea09e5faa7a63b16113d42b2b85ed6a1ffc863345effcdf4f5275'
            'eac8e2d34fbd25f1191314c53b5e67d312ac3bde1ea87bce92ee87bcc8e35886'
            '4c319b65712b1f890de1115b95edabf0094f68285cbf20bd82b85b4902f69f83'
            '5255a183cccd80b2bfbbf519b1cc8cec81ae40bbc0b5a88dfddd95532ece84ed')

prepare() {
  patch -d "$srcdir/${_full_name}" -Np2 -i "$srcdir/0001-Fix-vmxnet-module-on-kernels-3.16.patch"
  patch -d "$srcdir/${_full_name}" -Np2 -i "$srcdir/0002-Fix-d_alias-to-d_u.d_alias-for-kernel-3.18.patch"
  patch -d "$srcdir/${_full_name}" -Np2 -i "$srcdir/0003-Fix-f_dentry-msghdr-kernel-3.19.patch"
  patch -d "$srcdir/${_full_name}" -Np2 -i "$srcdir/0004-Support-backing-dev-info-kernel-4.0.patch"
}

package() {
  cd "$srcdir/${_full_name}"
  sed -i "s/${_dkms_version}/${pkgver}/g" ./modules/linux/dkms.sh
  sh ./modules/linux/dkms.sh ./ "${pkgdir}/usr/src"
  sed "s/%pkgver%/${pkgver}/g" "${srcdir}/dkms.conf.in" > "${pkgdir}/usr/src/${_name}-${pkgver}/dkms.conf"
  for _module in {"vmblock","vmci","vmsync","vsock"}; do
    rm -rf "${pkgdir}/usr/src/${_name}-${pkgver}/${_module}"
  done
}
