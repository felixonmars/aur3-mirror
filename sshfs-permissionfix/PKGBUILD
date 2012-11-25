# Maintainer: Christoph Wiechert <wio@psitrax.de>
pkgname=sshfs-permissionfix
pkgver=2.4
pkgrel=1
pkgdesc="SSHFS with remote_dmask and remote_fmask options to set correct permissions on the server."
arch=('i686' 'x86_64')
url="http://andre.frimberger.de/index.php/linux/sshfs-fix-for-wrong-file-permissions-on-server/"
license=('GPL')
depends=('fuse' 'glib2' 'openssh')
provides=('sshfs')
conflicts=('sshfs')
makedepends=('pkgconfig')
source=("http://downloads.sourceforge.net/sourceforge/fuse/sshfs-fuse-${pkgver}.tar.gz"
	"permpatch-${pkgver}.patch")
md5sums=('3c7c3647c52ce84d09486f1da3a3ce24'
	'adfe0cf97d2bb3a0e59297b041a16bd4')

build() {
  cd "${srcdir}/sshfs-fuse-${pkgver}"
  patch -p1 < ../permpatch-${pkgver}.patch
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/sshfs-fuse-${pkgver}
  make DESTDIR="${pkgdir}" install || return 1
}
