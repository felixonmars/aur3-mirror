# Maintainer: Giancarlo Razzolini <grazzolini@gmail.com>
pkgname=mkinitcpio-chkcryptoboot
pkgver=0.0.2
pkgrel=2
pkgdesc="This hook checks for a modified bootloader code, in an encrypted boot setup, and warns the user to not enter his root device password"
arch=('any')
url="https://github.com/grazzolini/mkinitcpio-chkcryptoboot"
license=('BSD')
install=$pkgname.install
backup=('etc/default/chkcryptoboot.conf')
source=('ChangeLog' "$pkgname.install" 'chkcryptoboot.conf' 'chkcryptoboot_hook' 'chkcryptoboot_install' 'chkcryptoboot-profilealert.sh')
changelog='ChangeLog'
sha512sums=('8ce0b1dd4628bfbc5790c7c2c86c155575aa7097676df185b04217a754d7e9af61d07dce2e8f587b14643683692d1a6bc2ca6f04cd583a52e6ab98d07e599031'
            'dd1ec73389b65f8772d880ca13ea4298a9a8c2d6b8db0201f0385f1495e370b95e4e50bbd654c51f61db8f1aaca6e8958ce55127361263234a95d0a479c99f5b'
            '9b5cd5a1685354feadb6bc71484a972f4900c92488a627320e89808167888645d20f18ceec49f70414485f28c70bbea4d7bb1fe64639543432a7f646d06f9e1d'
            'ece3e6161151bc8708683152cc45db730c021ead0fe766d08d863871a5a219697507de7ff8ba89060c0f7ab3afecacfa4d779f906c6429bfbde284c357e6700e'
            'c495934d3a1e6effc1b8f6e796008b19be9344d4be7d4992c6e9fd4590f58348d673d10489955f654bc867fce3b0244a01cb855db4b995d85b0bb9c17dec1a14'
            '2ab9591f144c57358443964504e1ba182d413c5599242952c3f630a34b04bb51aa4bfab9301011fe830bbfae0703d8b02e4761c4eac17428b0b0abd6ceece0da')

package() {
  install -Dm644 "$srcdir/chkcryptoboot.conf"	   "$pkgdir/etc/default/chkcryptoboot.conf"
  install -Dm644 "$srcdir/chkcryptoboot_hook"      "$pkgdir/usr/lib/initcpio/hooks/chkcryptoboot"
  install -Dm644 "$srcdir/chkcryptoboot_install"   "$pkgdir/usr/lib/initcpio/install/chkcryptoboot"
  install -Dm755 "${srcdir}"/chkcryptoboot-profilealert.sh "${pkgdir}"/etc/profile.d/chkcryptoboot-profilealert.sh
}
