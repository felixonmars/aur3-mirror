# Maintainer: Sloger <sloger@gmail.com>
pkgname=simlif-themes
pkgver=1.0.0
pkgrel=1
pkgdesc="Flat design, card style themes for gtk, cinnamon, openbox, unity and xfwm4 from LinuxBar"
arch=(any)
url="http://tieba.baidu.com/f?kw=linux"
license=('GPL')
source=($pkgname-$pkgver.tar.gz)
md5sums=('c8995eff992ac1d497e0044235b476aa')

package() {
	cd "$srcdir"
    tar -zxf $pkgname-$pkgver.tar.gz || return 1

    install -d $pkgdir/usr/share/themes || return 1

    cp -R $srcdir/Simlif $pkgdir/usr/share/themes/ || return 1
}
