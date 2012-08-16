# Maintainer: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>

pkgname=hblocker-gtk
pkgver=0.5
pkgrel=1
pkgdesc="GTK+ Interface for ExtHBlocker"
license=(GPL3)
arch=(i686 x86_64)
depends=('hblocker>=0.5' 'gtk2-perl')
url="http://exthblocker.de"
source=(http://exthblocker.de/linux/hblocker-gtk_${pkgver}-dev.tar.xz)
md5sums=('42cf13c65f6533514cc9c1ea44465dc4')

build() {
cd ${srcdir}/hblocker-gtk_${pkgver}-dev
perl Makefile.PL INSTALLDIRS=vendor || return 1
make || return 1
make DESTDIR=${pkgdir} install || return 1

# Remove .packlist and perllocal.pod files.
find ${pkgdir} -name '.packlist' -delete
find ${pkgdir} -name 'perllocal.pod' -delete
}
