# Maintainer: Jakob 'flocke' Nixdorf <flocke [swirly thing] user-helfen-usern [dot] de>

pkgname=bash-view-git
pkgver=20100405
pkgrel=1
pkgdesc="A little perl script to read quotes from various bash pages"
url="http://gitorious.org/bash-view/bash-view"
arch=(any)
license=(GPL3)
depends=('perl' 'perl-libwww')
makedepends=('git')
source=()
md5sums=()

_gitroot="git://gitorious.org/bash-view/mainline.git"
_gitname="mainline"

build() {
cd ${srcdir}

msg "Connecting to gitorious.org GIT server...."
if [ -d ${srcdir}/$_gitname ] ; then
cd $_gitname && git pull origin
msg "The local files are updated."
else
git clone $_gitroot
fi

msg "GIT checkout done or server timeout"
msg "Starting make..."

cd ${srcdir}
cp -r $_gitname $_gitname-build
cd ${srcdir}/$_gitname-build

perl Makefile.PL INSTALLDIRS=vendor || return 1
make || return 1
make DESTDIR=${pkgdir} install || return 1

# Remove .packlist and perllocal.pod files.
find ${pkgdir} -name '.packlist' -delete
find ${pkgdir} -name 'perllocal.pod' -delete

rm -rf ${srcdir}/$_gitname-build
}
