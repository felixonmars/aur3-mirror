# Maintainer: onexused <aursignup dot kyoo at xoxy dot net >
# Modified to fit your television.
pkgname=tuxonice-sources
pkgver=2.6.36
pkgrel=1
pkgdesc="Vanilla kernel sources patched with Gentoo and tuxonice patches."
arch=(any)
url="http://www.kernel.org, http://tuxonice.net, http://www.gentoo.org"
license=('GPL2')
optdepends=('hibernate-script: To use hibernation'
            'tuxonice-userui: For a text or fbsplash hibernation UI')
# As this package installs kernel *sources*, rather than a binary named
# "kernel26" or the like, I believe it does not conflict with any other package.
install=tuxonice-sources.install

source=(http://www.kernel.org/pub/linux/kernel/v2.6/linux-$pkgver.tar.bz2
   http://tuxonice.net/files/tuxonice-3.2-rc2-for-$pkgver.patch.bz2
   genpatches-$pkgver-8.base.tar.bz2
   genpatches-$pkgver-8.extras.tar.bz2)
md5sums=(61f3739a73afb6914cb007f37fb09b62
9e9986a855a12e44b143f741fb6ed26d
a7aa5326443d6cd51407952206294e4e
c2c4ac403a65a758827f9ad38543d57d
)

build() {
   cd $srcdir/linux-$pkgver
   for I in $srcdir/$pkgver/*.patch
      do patch -Np1 < "$I"
   done
   patch -Np1 < $srcdir/tuxonice-3.2-rc2-for-$pkgver.patch
}

package() {
	mkdir -p $pkgdir/usr/src
	mv $srcdir/linux-$pkgver $pkgdir/usr/src/linux-$pkgver-tuxonice-$pkgrel
}
