# Creator: chris_l. Email:  echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|sed 's/[0-9]//g'
# Maintainer: j.lahav at gmail dot com
pkgname=lxmp
pkgver=0.7.0
pkgrel=0
pkgdesc="A mod (tracker) music player for Linux."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/lxmp/"
license=('GPL3')
depends=('gtkmm3' 'libbass')
makedepends=('p7zip')
source=("http://downloads.sourceforge.net/project/lxmp/lxmp/lxmp-0.7.0.7z")
md5sums=('791014b15f71ece1f33fce0f1fd89ac3')

build() {
    cd "$srcdir/"
    make || return 1
}

package() {
	install -Dm755 lxmp "$pkgdir/usr/bin/lxmp" || return 1
}
