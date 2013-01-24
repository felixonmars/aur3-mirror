# Maintainer: Marcus Weinhold <marcus at weinhold dot org>
pkgname=mkinitcpio-encrypt-multi
pkgver=0.1
pkgrel=1
pkgdesc='mkinitcpio hook to decrypt multiple LUKS-devices'
arch=('any')
url="http://www.archlinux.org/"
license=('GPL')
depends=('mkinitcpio' 'cryptsetup')
source=("encrypt-multi_hook" "encrypt-multi_install")
md5sums=('6ad4da63bc41018d281f102105ed6b37'
         '711927d27994e328167ce7072d52e2c5')

package() {
        install -D -o0 -g0 -m644 ${srcdir}/encrypt-multi_hook ${pkgdir}/usr/lib/initcpio/hooks/encrypt-multi
        install -D -o0 -g0 -m644 ${srcdir}/encrypt-multi_install ${pkgdir}/usr/lib/initcpio/install/encrypt-multi
}
