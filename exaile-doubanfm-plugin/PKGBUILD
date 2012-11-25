# Maintainer: JoveYu <yushijun110[at]gmail[dot]com>

pkgname=exaile-doubanfm-plugin
pkgver=0.0.13
pkgrel=3
pkgdesc="a desktop client for the online music service, Douban radio."
url="https://github.com/sunng87/exaile-doubanfm-plugin"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('exaile')
source=("https://github.com/downloads/sunng87/exaile-doubanfm-plugin/doubanfm-0.0.13d-exaile033.tar.gz")
md5sums=('4d47f15e869df7674775af3c2a815523')

package() {
    mkdir -p ${pkgdir}/usr/share/exaile/plugins
    cp -R ${srcdir}/doubanfm ${pkgdir}/usr/share/exaile/plugins
}

