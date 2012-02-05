# Contributor: VuDu <vudu[dot]curse[at]gmail[dot]com>
# Contributor: toni <antoniogmc[at]gmail[dot]com>

pkgname=gkrellm2-cpufreq
pkgver=0.6.1
pkgrel=2
pkgdesc="A plugin for displaying and manipulating CPU frequency."
arch=('i686')
url="http://iacs.epfl.ch/~winkelma/gkrellm2-cpufreq/"
license=('GPL')
depends=('gkrellm')
optdepends=('sudo: change the CPU frequency and/or cpufreq governor' )
source=("http://christoph.winkelmann.googlepages.com/${pkgname}-${pkgver}.tar.gz")
md5sums=('ddbe4e9574ae818697271c39191f737d')

build() {
    cd $srcdir/$pkgname-$pkgver
    make || return 1
    make DESTDIR=$startdir/pkg install || return 1
}
