# Contributor: Maciej Mazur
# Contributor: enderst <enderst@gmail.com>
# Contributor: mathieui <mathieui@gmail.com>

pkgname=backupninja
pkgver=1.0.1
_remotedir=275
pkgrel=1
pkgdesc="A centralized way to configure and schedule many different backup utilities"
arch=('i686' 'x86_64')
url="https://labs.riseup.net/code/projects/backupninja"
license=('GPL')
depends=('bash' 'gawk')
optdepends=('rdiff-backup: rdiff backups' 'gzip' 'hwinfo')
source=(https://labs.riseup.net/code/attachments/download/${_remotedir}/backupninja-${pkgver}.tar.gz)
md5sums=('afd80afa50faa79e721f77913741c31a')

build() {
  cd "$srcdir/backupninja-$pkgver"

  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/backupninja-$pkgver"
  make DESTDIR="$pkgdir" install
}
