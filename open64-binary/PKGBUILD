# Maintainer:  cuihao <cuihao dot leo at gmail dot com>
# Contributor: Jens Staal <staal1978@gmail.com>

pkgname=open64-binary
pkgver=5.0
pkgrel=1
pkgdesc='Open64 is the final result of research contributions from a number of compiler groups around the world.'
arch=('i686' 'x86_64')
license=('GPL2')
url='http://www.open64.net/'
depends=('gcc-libs' 'sh')
conflicts=('open64')
provides=('open64')
source=("http://sourceforge.net/projects/open64/files/open64/Open64-5.0/open64-$pkgver-0.x86_64.tar.bz2")
noextract=("${source[@]##*/}")
md5sums=('4fc65620579d9c966b54f9fbf0b74300')

package() {
    mkdir -p "$pkgdir/opt"
    tar jxvf ${noextract[0]} -C "$pkgdir/opt" --no-same-owner

    mkdir -p "$pkgdir/etc/profile.d"
    echo "export PATH=\$PATH:'/opt/open64-$pkgver/bin'" > "$pkgdir/etc/profile.d/open64.sh"
    chmod a+x "$pkgdir/etc/profile.d/open64.sh"
}
