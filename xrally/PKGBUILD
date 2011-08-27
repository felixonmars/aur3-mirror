# $Id: PKGBUILD 7789 2008-08-04 09:49:10Z ronald $
# Contributor: dale <dale@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: Dany Martineau <dany.luc.martineau at gmail.com>

pkgname=xrally
pkgver=1.1.1
pkgrel=2
pkgdesc="XRally is a clone of the Rally X arcade game"
url="http://www.linuxgames.com/xrally/"
depends=('libxpm')
makedepends=('make')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-1.1.tar.bz2
        xrally.desktop patch-graphics.c  patch-score.c  patch-soundplayer.h
        patch-global.h   patch-menu.c      patch-sound.c)
license=('GPL2')
arch=('i686' 'x86_64')
md5sums=('ecb8027508a65a960c0b804ba1f8363c'
	 'ef0a5ea819c058a08dad0271d3872291'
         '95860f27208c864d320b5ee1feff3666'
         'b2dca915ffae8bcf7d035a4c5d829d16'
         '0fe46747e3e92f1642d8a8fd2d12efbe'
         'c89630659820383871d5159c9379025a'
         'b18611ae8e4cadbd399a7edaafb966a2'
         'd231f7f87cffed964abb8205aaec06ef')

build() {
cd ${srcdir}/${pkgname}
patch -p0 < ../patch-graphics.c
patch -p0 < ../patch-score.c
patch -p0 < ../patch-soundplayer.h
patch -p0 < ../patch-global.h
patch -p0 < ../patch-menu.c
patch -p0 < ../patch-sound.c
./configure --prefix=/usr
make || return 1
make prefix=${pkgdir}/usr install
mkdir -p ${pkgdir}/usr/share/applications
cp ../xrally.desktop ${pkgdir}/usr/share/applications
}

