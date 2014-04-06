# Maintainer: kfgz <kfgz at interia dot pl>
# Contributor: Abakus <java5 at arcor dot de>

pkgname=afflib
pkgver=3.7.2
pkgrel=1
pkgdesc="is an extensible open format for the storage of disk images and related forensic information."
arch=('i686' 'x86_64')
url="http://www.sisyphus.ru/en/srpm/Sisyphus/libaff"
license=('custom')
depends=('zlib' 'openssl' 'fuse')
source=("ftp://ftp.altlinux.org/pub/distributions/ALTLinux/Sisyphus/files/SRPMS//libaff-${pkgver}-alt1.src.rpm")
md5sums=('6d7969cd73a69d25b33682c599cbddbc')

prepare() {
  cd "${srcdir}"
  tar xvf libaff-${pkgver}.tar
}

build() {
  cd "${srcdir}"/libaff-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}"/libaff-${pkgver}
  make DESTDIR="${pkgdir}" install
}
