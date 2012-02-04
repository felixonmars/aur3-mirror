# Contributor: Andreas Baumann <abaumann@yahoo.com>

pkgname=nvram-wakeup
pkgver=1.1
pkgrel=2
pkgdesc="Reads and writes the WakeUp time in the BIOS."
arch=(i686 x86_64)
url="http://sourceforge.net/projects/nvram-wakeup"
license="GPL"
depends=('bash')
source=(http://downloads.sourceforge.net/project/nvram-wakeup/nvram-wakup-${pkgver}.tar.gz)
md5sums=('ebd6e276167ba4351ecb1ea2bd368422')
options=('!docs')

build() {
  cd $srcdir/nvram-wakup-$pkgver

  # standard Makefile variables (DESTDIR and prefix)
  sed -i 's@${prefix}@${DESTDIR}${prefix}@g' Makefile
  # FHS compliant location of man pages is /usr/share/man, not /usr/man
  sed -i 's@${DESTDIR}${prefix}/man@${DESTDIR}${prefix}/share/man@g' Makefile

  make || return 1
  make DESTDIR=$pkgdir prefix=/usr install
}
