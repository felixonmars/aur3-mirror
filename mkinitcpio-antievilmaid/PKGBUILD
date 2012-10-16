# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=mkinitcpio-antievilmaid
pkgver=0.1
pkgrel=2
pkgdesc="mkinitcpio hook to enable Anti Evil Maid support."
arch=('i686' 'x86_64')
url="https://github.com/mutantmonkey/mkinitcpio-antievilmaid"
license=('GPL')
depends=('mkinitcpio' 'trousers')
optdepends=("antievilmaid: Anti Evil Maid installation script")
source=('install_antievilmaid'
        'hook_antievilmaid'
        '69-anti-evil-maid.rules'
        'hosts'
        'passwd'
        'shadow')
sha256sums=('a69378615edd314fd6ccae8623a6f32551031e5cf914eacb0bb03f8a522dc5fb'
            'be60e31b652e1f5cec545e8be38d99534019e5697a3573232594556ec039f949'
            '89d1e1f825ef7f3f7bc835d0ad625144c6ec38fb5285689ed58a9d65cc055e6d'
            '498f494232085ec83303a2bc6f04bea840c2b210fbbeda31a46a6e5674d4fc0e'
            '4b263523f4904bfe340a3208f327697ebd78f9f921e8be0dabdf33535c54a1b5'
            '674c97df063879b4ba04f70312dc67762a36dc81b49a2b2131e7f71432efa1a3')

package() {
  install -Dm644 install_antievilmaid \
    "${pkgdir}/usr/lib/initcpio/install/antievilmaid"
  install -Dm644 hook_antievilmaid \
    "${pkgdir}/usr/lib/initcpio/hooks/antievilmaid"
  install -Dm644 69-anti-evil-maid.rules \
    "${pkgdir}/usr/lib/initcpio/udev/69-anti-evil-maid.rules"
  install -Dm644 hosts "${pkgdir}/usr/lib/initcpio/antievilmaid/hosts"
  install -Dm644 passwd "${pkgdir}/usr/lib/initcpio/antievilmaid/passwd"
  install -Dm644 shadow "${pkgdir}/usr/lib/initcpio/antievilmaid/shadow"
}

# vim:set ts=2 sw=2 et:
