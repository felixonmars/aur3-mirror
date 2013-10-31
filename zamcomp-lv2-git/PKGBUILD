# Maintainer: Carlo Ascani <carlo.ratm@gmail.com>

pkgname=zamcomp-lv2-git
pkgver=29.4d636bf
pkgrel=3
pkgdesc="A LV2 compressor plugin from http://www.zamaudio.com"
arch=('i686' 'x86_64')
url="https://github.com/zamaudio/zamcomp"
license=('GPL2')
depends=('lv2' 'lv2-c++-tools')
makedepends=('git')
# The git repo is detected by the 'git:' or 'git+' beginning. The branch
# '$pkgname' is then checked out upon cloning, expediating versioning:
source=("$pkgname"::'git://github.com/zamaudio/zamcomp.git')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver()
{
    cd "$srcdir/$pkgname"
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
    cd "$srcdir/$pkgname"
    make
    git checkout mono
    make
}

package()
{
    cd "$srcdir/$pkgname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    git checkout stereo
    make PREFIX=/usr DESTDIR="$pkgdir" install
}

