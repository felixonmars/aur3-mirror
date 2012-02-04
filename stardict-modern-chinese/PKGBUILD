# Contributor: ShadowKyogre <shadowkyogre@gmail.com>

pkgname=stardict-modern-chinese
pkgver=2.4.2
pkgrel=1
pkgdesc="the Modern Chinese Dictionary for StarDict"
arch=('i686' 'x86_64')
depends=('stardict')
url="http://stardict.sourceforge.net"
license=('GPL')
md5sums=('fa1497bb7f3ac46eceb6c0a0321c722b')
source=(http://reciteword.cosoft.org.cn/stardict-iso/stardict-dic/zh_CN/stardict-xiandaihanyucidian_fix-$pkgver.tar.bz2)

build() {
    cd $startdir/src/stardict-xiandaihanyucidian_fix-$pkgver
    mkdir -p $startdir/pkg/usr/share/stardict/dic/modern-chinese
    install -m 644 xiandaihanyucidian_fix.dict.dz \
                   xiandaihanyucidian_fix.idx \
                   xiandaihanyucidian_fix.ifo \
                   $startdir/pkg/usr/share/stardict/dic/modern-chinese/
}
