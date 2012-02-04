# Maintainer: kennytm <kennytm@gmail.com>
# Contributor: kennytm <kennytm@gmail.com>
# Contributor: Evangelos Foutras <foutrelis@gmail.com>
pkgname=fusionsound-git
pkgver=20111209
pkgrel=1
pkgdesc='FusionSound is a very powerful audio sub system in the manner of DirectFB and a technical demonstration of Fusion.'
arch=('i686' 'x86_64')
url='http://www.directfb.org/index.php?path=Platform%2FFusionSound'
license=('LGPL')
makedepends=('git' 'gcc' 'autoconf')
depends=('directfb' 'linux-fusion')
provides=('fusionsound=1.1.1')
conflicts=('fusionsound')
source=('FusionSound.patch')
md5sums=('11a754eb444047443ddc46a9adbabf46')
optdepends=('ffmpeg: playing sound based on FFmpeg')

_gitroot='git://git.directfb.org/git/directfb/core/FusionSound.git'
_gitname='FusionSound'

build() {
    msg "Connecting to git server..."
    if [ -d $_gitname ]; then
        cd "$_gitname" && git pull origin
        msg "The local files are updated."
    else
        git clone --depth=1 $_gitroot $_gitname
        cd "$_gitname"
        git apply --ignore-whitespace "$srcdir/FusionSound.patch"
    fi
    msg "git checkout done"

    rm -rf "$srcdir/$_gitname-build"
    mkdir "$srcdir/$_gitname-build"
    cd "$srcdir/$_gitname-build"
    autoreconf -i --warning=none "../$_gitname"
    "../$_gitname/configure" --prefix=/usr
    make
}

package() {
    cd "$srcdir/$_gitname-build"
    make DESTDIR="$pkgdir/" install
}



