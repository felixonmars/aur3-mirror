# Contributor: jim945 [at] mail . r [u]
pkgname=mount-hook
pkgver=0.1
pkgrel=2
pkgdesc="mounting from the loader"
url="http://www.kernel.org"
arch=(any)
license=('GPL')
install=${pkgname}.install
depends=(mkinitcpio)
source=(mount-hook_hook mount-hook_install)

package() {
    install -o root -g root -D ${srcdir}/mount-hook_hook ${pkgdir}/usr/lib/initcpio/hooks/mount
    install -o root -g root -D ${srcdir}/mount-hook_install ${pkgdir}/usr/lib/initcpio/install/mount
}

sha512sums=('de967919da53e3e5701ea03e6276d74caa172c0b20a98e4791ef3a46fe0c30c42de68fc7089ce01126b94da780388d3063386e7ede0da99a8458bca3c0f4f97b'
            '6faa8c08167f8c074b2566908b0c346bc36871178300bcdb30e5b7e5f00a065e4b7c38c6307f1045a4ee8543a39cef390aa0aa6fabc4e0bfc5aa2afb668703d8')
