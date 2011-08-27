pkgname=repo_manager
pkgver=0.3
pkgrel=1
pkgdesc="A tool for managing Arch Linux repositories remotely through ssh"
arch=(i686 x86_64)
url="http://www.mupuf.org/project/repo_manager/"
license=('GPL')
depends=('pycrypto' 'python-yaml' 'python-paramiko')
makedepends=()
conflicts=()
replaces=()
options=()
groups=()
backup=(etc/repo_manager.conf)
install=repo_manager.install
source=(http://www.mupuf.org/media/files/${pkgname}-${pkgver}.tar.bz2)
md5sums=('340cf68c14fa8ada542156bf15e58ecc')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make || return 1
  make DESTDIR="$pkgdir" install
}
