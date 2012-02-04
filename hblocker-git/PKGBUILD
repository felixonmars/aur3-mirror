# Maintainer: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>

pkgname=hblocker-git
pkgver=20110902
pkgrel=1
pkgdesc="A perl script to manage the /etc/hosts file as Ad/Hostblocker"
license=(GPL3)
arch=(i686 x86_64)
depends=('perl' 'perl-libwww' 'perl-crypt-ssleay' 'perl-array-diff')
provides=('hblocker=0.5')
conflicts=('hblocker')
makedepends=('git')
url="http://exthblocker.de"
source=()
md5sums=()

_gitroot="git://git.shadowice.org/hblocker.git"
_gitname="hblocker"

build() {
msg "Connecting to gitorious.org GIT server...."

if [ -d $srcdir/$_gitname ] ; then
   cd $_gitname && git pull origin
   msg "The local files are updated."
else
   git clone $_gitroot
fi

msg "GIT checkout done or server timeout"
msg "Starting make..."

rm -rf $srcdir/$_gitname-build
cp -r $srcdir/$_gitname $srcdir/$_gitname-build
cd $srcdir/$_gitname-build

perl Makefile.PL INSTALLDIRS=vendor || return 1
make || return 1
make DESTDIR=${pkgdir} install || return 1

# Remove .packlist and perllocal.pod files.
find ${pkgdir} -name '.packlist' -delete
find ${pkgdir} -name 'perllocal.pod' -delete
}
