# Maintainer: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>

pkgname=hblocker
pkgver=0.5
pkgrel=1
pkgdesc="A perl script to manage the /etc/hosts file as Ad/Hostblocker"
license=(GPL3)
arch=(i686 x86_64)
depends=('perl' 'perl-libwww' 'perl-crypt-ssleay' 'perl-array-diff')
url="http://exthblocker.de"
source=(http://exthblocker.de/linux/hblocker_${pkgver}-dev.tar.xz)
md5sums=('10600939018e33594d314f3bd08e9076')

build() {
cd ${srcdir}/hblocker_${pkgver}-dev
perl Makefile.PL INSTALLDIRS=vendor || return 1
make || return 1
make DESTDIR=${pkgdir} install || return 1

# Remove .packlist and perllocal.pod files.
find ${pkgdir} -name '.packlist' -delete
find ${pkgdir} -name 'perllocal.pod' -delete
}
