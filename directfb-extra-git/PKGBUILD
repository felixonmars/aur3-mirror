# Maintainer: kennytm <kennytm@gmail.com>
# Contributor: kennytm <kennytm@gmail.com>
pkgname=directfb-extra-git
pkgver=20111209
pkgrel=1
pkgdesc='Additional image/video/font providers for DirectFB.'
arch=('i686' 'x86_64')
url='http://git.directfb.org/?p=extras/DirectFB-extra.git;a=summary'
license=('LGPL')
makedepends=('git' 'gcc' 'autoconf')
depends=('directfb')
provides=('directfb-extra=1.4.15')
conflicts=('directfb-extra')
source=('DirectFB-extra.patch')
md5sums=('c41a45c9aa4d1206a84a767724ed027e')
optdepends=('ffmpeg: playing video based on FFmpeg'
            'fusionsound: to have sound in video')

_gitroot='git://git.directfb.org/git/directfb/extras/DirectFB-extra.git'
_gitname='DirectFB-extra'

build() {
    msg "Connecting to git server..."
    if [ -d $_gitname ]; then
        cd "$_gitname" && git pull origin
        msg "The local files are updated."
    else
        git clone --depth=1 $_gitroot $_gitname
        cd "$_gitname"
        git apply --ignore-whitespace "$srcdir/DirectFB-extra.patch"
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



