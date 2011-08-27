# Contributor: firefoxmmx <firefoxmmx@gmail.com>

pkgname=scim-wnwb
pkgver=0.1.1
pkgrel=1
pkgdesc="WanNengWubi for SCIM"
arch=(i686 x86_64)
url="http://fghost.javaeye.com/blog/108909"
license=('GNU Lesser General Public License')
makedepends=('gcc' 'pkgconfig' 'diffutils' 'make' 'scim')
depends=('scim')
source=('http://forum.ubuntu.org.cn/download/file.php?id=26161' 'http://forum.ubuntu.org.cn/download/file.php?id=26133')
md5sums=('9d64271955d0ab2505dc3411189fd59f' 'bb7b706c2b817f3703955bdc13b16622')
_prefix=../pkg/usr/share/scim
build(){
    cd $startdir/src
    install -Dm644 wnwb.bin $_prefix/tables/wnwb.bin
    install -Dm644 wnwblogo.gif $_prefix/icons/wnwb.gif
}
