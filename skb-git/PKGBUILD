# Maintainer: Holden Cox <segrived@gmail.com>
pkgname=skb-git
pkgver=0.4
pkgrel=2
pkgdesc="Simple keyboard layout indicator. Git version"
arch=('i686' 'x86_64')
url=('https://github.com/polachok/skb')
license=('GPL')
depends=()
source=()
md5sums=()
conflicts=(skb)

_gitroot=https://github.com/polachok/skb
_gitname=skb

build() {
    cd ${srcdir}
    msg "Connecting to GIT server..."

    if [ -d $_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot $_gitname
    fi
    msg "GIT checkout done or server timeout"
    msg "Starting make..."

    cd "$srcdir/$_gitname"
    make || return 1
    make DESTDIR="$pkgdir" install || return 1
    
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

