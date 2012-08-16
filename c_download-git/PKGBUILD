# Maintainer: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>

pkgname=c_download-git
pkgver=20100102
pkgrel=1
pkgdesc="Library to download files single or multithreaded"
url="https://www.uhuc.de/index.php?topic=314.0;all"
arch=('i686' 'x86_64')
license=(GPL3)
depends=('curl')
makedepends=('cmake' 'git')
source=()
md5sums=()

_gitroot="git://gitorious.org/cgetvid/c_download.git"
_gitname="c_download"

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
if [ -d ${srcdir}/$_gitname-build ] ; then
rm -rf $_gitname-build
fi

cp -r $_gitname $_gitname-build

cd ${srcdir}/$_gitname-build
cmake . -DCMAKE_INSTALL_PREFIX=/usr/ || return 1
make || return 1
make DESTDIR=${pkgdir} install || return 1

}
