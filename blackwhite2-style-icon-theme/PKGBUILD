# Contributor : Maxime Buffa mbuffa [at] gmail [dot] com
pkgname=blackwhite2-style-icon-theme
pkgver=20080414
pkgrel=1
pkgdesc="Black-white 2 Style icon theme."
arch=('i686' 'x86_64')
url="http://gnome-look.org/content/show.php/black-white+2+Style?content=72619"
license=('GPL')
source=(http://fc02.deviantart.com/fs29/f/2008/105/2/b/black_white_2_Style_by_DBGtheKafu.tar)
md5sums=('586f089567710dcbf020c842984a5ac5')

build() {
    mkdir -p $pkgdir/usr/share/icons/black-white2-style
    tar zxvf $srcdir/black-white\ 2\ Style/black-white_2-Style.tar.gz
    chmod a+r -R $srcdir/black-white_2-Style/*
    cp -R $srcdir/black-white_2-Style/* $pkgdir/usr/share/icons/black-white2-style
}
