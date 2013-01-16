# Maintainer: j.lahav at gmail dot com

pkgname=lxmc
pkgver=0.3
pkgrel=0
pkgdesc="A mod music decoder (to stdout) for Linux."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/lxmp/"
license=('GPLv3')
depends=('libbass')
makedepends=('p7zip')
source=("http://downloads.sourceforge.net/project/lxmp/lxmc-0.3.7z")
md5sums=('e770fc9ae0b4ea7eeb7ec7bd149937d8')

build() {
    cd "$srcdir/"
    make || return 1
    install -Dm755 lxmc "$pkgdir/usr/bin/lxmc" || return 1
}
