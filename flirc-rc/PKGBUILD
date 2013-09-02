# Maintainer: Chris Simons <chris@simonsmail.net>
pkgname=flirc-rc
pkgver=v1.0.0_rc.4
pkgrel=1
pkgdesc="Software for using Flirc USB Device"
arch=('i686' 'x86_64')
url="http://flirc.tv"
license=('Unknown')
depends=('')
conflicts=('flirc')

source=(http://downloads.flirc.tv/beta/packages/Flirc-${pkgver//_/-}.zip)
md5sums=('b9f0e74ca8625e5f2b7800b7acea4a29')

build() {
    rel_url='http://downloads.flirc.tv/beta/packages/'
    rel_info=$(curl -s $rel_url | md5sum | cut -f1 -d' ')
    rel_hash='a8c626fbe9d4eeacb8e6d95d57116252'
    if [ $rel_info != $rel_hash ]
        then
            echo -e "\e[m\e[1;31m\
            \nA newer version seems to be available\
            \nPlease flag package out-of-date\e[m\n"
    fi
}
package() {
    cd "$srcdir/release/linux"
    mkdir -p $pkgdir/usr/local/bin
    cp "$srcdir/release/linux/flirc_util" "$pkgdir/usr/local/bin"
    cp "$srcdir/release/linux/Flirc" "$pkgdir/usr/local/bin"
}
