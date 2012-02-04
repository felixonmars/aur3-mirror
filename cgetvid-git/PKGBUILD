# Maintainer: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>

pkgname=cgetvid-git
pkgver=20101021
pkgrel=1
pkgdesc="cgetvid is an easily extensible video downloader"
url="https://shadowice.org/?p=cgetvid"
arch=('x86_64' 'i686')
license=(GPL3)
depends=('qt')
makedepends=('cmake' 'git')
conflicts=('cgetvid')
source=()
md5sums=()

_gitroot="git://git.shadowice.org/cgetvid.git"
_gitname="cgetvid"

build() {

cd ${srcdir}

msg "Connecting to shadowice.org GIT server...."

if [ -d ${srcdir}/$_gitname ] ; then
cd $_gitname && git pull origin
msg "The local files are updated."
else
git clone $_gitroot
fi

msg "GIT checkout done or server timeout"
msg "Starting make..."

cd ${srcdir}
if [ -d ${srcdir}/$_gitname-build ] ; then
rm -rf $_gitname-build
fi

cp -r $_gitname $_gitname-build

cd ${srcdir}/$_gitname-build
cmake . -DCMAKE_INSTALL_PREFIX=/usr/ || return 1
make || return 1
make DESTDIR=${pkgdir} install || return 1

}
