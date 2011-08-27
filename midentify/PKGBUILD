# Contributor: Jan Stępień <jstepien@users.sourceforge.net>

pkgname=midentify
pkgver=1.0_rc2
pkgrel=2
pkgdesc="A wrapper around the MPlayer's -identify functionality."
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.mplayerhq.hu/"
depends=('mplayer')
source=(http://www.mplayerhq.hu/MPlayer/releases/MPlayer-1.0rc2.tar.bz2)
md5sums=('7e27e535c2d267637df34898f1b91707')

build() {
    mkdir -p $startdir/pkg/usr/bin || return 1
    install -m755 "$srcdir/MPlayer-1.0rc2/TOOLS/midentify" $startdir/pkg/usr/bin/midentify || return 1
}
