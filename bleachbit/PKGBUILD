# Maintainer: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Arnaud Durand <biginozNOSPAM_at_free.dot.fr>
# Contributor: Nuno Araujo <nuno.araujo at russo79.com>

pkgname=bleachbit
pkgver=0.9.0
pkgrel=1
pkgdesc="Deletes unneeded files to free disk space and maintain privacy"
arch=('any')
url="http://bleachbit.sourceforge.net/"
license=('GPL3')
depends=('pygtk>=2' 'python2>=2.6')
optdepends=('gksu')
install=$pkgname.install
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2
        $pkgname-admin.sh
        $pkgname-admin.png
        $pkgname-admin.desktop)

md5sums=('a7de1a425c9c84467aa7be879a3fe95e'
         'a424bec443cc519391c837948fa98fdd'
         'ddd834baa40d481a603333638e735825'
         'fc13f064e8970af4418486469dce05d0')

build() {
    cd $srcdir/$pkgname-$pkgver

    # Fix python2 header
    for file in $(find . -name '*.py' -print); do
        sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
        sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
    done
    sed -i 's/python/python2/g' Makefile

    # Compile
    make prefix=/usr DESTDIR=$pkgdir PYTHON=python2 install
}

package() {
    # Install bin, icon and desktop file
    install -Dm 755 $srcdir/$pkgname-admin.sh $pkgdir/usr/bin/$pkgname-admin
    install -Dm 644 $srcdir/$pkgname-admin.png $pkgdir/usr/share/pixmaps/$pkgname-admin.png
    install -Dm 644 $srcdir/$pkgname-admin.desktop $pkgdir/usr/share/applications/$pkgname-admin.desktop
}
