# $Id: PKGBUILD,v 1.10 2007/09/21 04:35:20 eric Exp $
# Contributor: p2k <Patrick.Schneider@uni-ulm.de>
# Contributor: twa022 <twa022@gmail.com>
# Contributor: Abakus <java5@arcor.de>
pkgname=lineakd
pkgver=0.9
pkgrel=5
pkgdesc="Linux Support for Easy Access and Internet Keyboards"
arch=('i686' 'x86_64')
url="http://lineak.sourceforge.net/"
license=('GPL')
depends=('gcc-libs' 'libxext' 'libsm' 'libxtst')
backup=('etc/lineakkb.def')
options=('!libtool' '!makeflags')
source=(http://prdownloads.sourceforge.net/sourceforge/lineak/$pkgname-$pkgver.tar.gz
        http://archive.ubuntu.com/ubuntu/pool/universe/l/lineakd/lineakd_0.9-6.diff.gz
        lineakd)

build() {
    cd $srcdir/$pkgname-$pkgver
    patch -Np1 -i ../lineakd_0.9-6.diff
    for _patch in $( cat $srcdir/$pkgname-$pkgver/debian/patches/series ) ; do
		patch -Np1 -i $srcdir/$pkgname-$pkgver/debian/patches/${_patch}
	done
	cp ./admin/acinclude.m4.in ./acinclude.m4
	cat ./admin/lineak.m4.in >> ./acinclude.m4
	mkdir ./m4
	autoreconf -fvi
    ./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/man --enable-evtest
    make || return 1
    make DESTDIR=$pkgdir install
    install -D -m755 $srcdir/lineakd $startdir/pkg/etc/rc.d/lineakd
}
md5sums=('8a45672a6cea666873398ecc36a5070c'
         '1d8f877167aa06a1a40d87846f4721b5'
         'e767f71a449aa898ade42271419b0406')
