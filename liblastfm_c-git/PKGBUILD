# Maintainer: Jakob Nixdorf <flocke [swirly thing] user-helfen-usern [dot] de>

pkgname=liblastfm_c-git
pkgver=20111229
pkgrel=2
pkgdesc="An unofficial C-API for the Last.fm web service written with libcurl"
license=(GPL3)
arch=(i686 x86_64)
depends=('curl')
makedepends=('git')
provides=('liblastfm_c')
conflicts=('liblastfm_c')
url="http://sourceforge.net/projects/liblastfm"
source=()
md5sums=()

_gitroot="git://liblastfm.git.sourceforge.net/gitroot/liblastfm/liblastfm"
_gitname="liblastfm"

build() {

msg "Connecting to GIT server...."

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

./autogen.sh
./configure --prefix=/usr || return 1
make || return 1
make DESTDIR=$pkgdir install || return 1

}
