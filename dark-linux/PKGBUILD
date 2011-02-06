# Maintainer: Josip <josipponjavic at gmail dot com>
# Contributor:

pkgname=dark-linux
pkgver=0.6
pkgrel=1
pkgdesc="This is basicly improved theme from my earlier no-name-jet version theme..."
arch=("any")
url="http://metak.deviantart.com/art/Dark-linux-0-6-150406617"
license=("CCPL")
depends=("")

source=(http://fc08.deviantart.net/fs70/f/2010/118/4/d/Dark_linux_0_6_by_metak.zip)
md5sums=('a80b1d51bb5e6719b92c4b8b0826e88f')

build() {
	mkdir -p $pkgdir/usr/share/themes/
        mkdir -p $pkgdir$HOME/.emerald/themes/
	cd $srcdir/
	cp -r "Dark-linux-0.6" "$pkgdir/usr/share/themes"
	cp -r "$srcdir/emerald/Dark-linux-0.6" "$pkgdir$HOME/.emerald/themes"
}

