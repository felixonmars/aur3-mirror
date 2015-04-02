# Maintainer: Giancarlo Razzolini <grazzolini@gmail.com>
pkgname=mkinitcpio-chkcryptoboot
pkgver=0.0.3
pkgrel=2
pkgdesc="This hook checks for a modified bootloader code, in an encrypted boot setup, and warns the user to not enter his root device password"
arch=('any')
url="https://github.com/grazzolini/mkinitcpio-chkcryptoboot"
license=('BSD')
install=$pkgname.install
backup=('etc/default/chkcryptoboot.conf')
source=('ChangeLog' "$pkgname.install" 'chkcryptoboot.conf' 'chkcryptoboot_hook' 'chkcryptoboot_install' 'chkcryptoboot-profilealert.sh')
changelog='ChangeLog'
sha512sums=('22362a723209ee0bdaf153e4e0c059895286d8adcb9561ec72aded1813db56b8bd4d413c97c1d167ce4991954b7dc4245a96726db7af3427a3438e766fd249e3'
            'dd1ec73389b65f8772d880ca13ea4298a9a8c2d6b8db0201f0385f1495e370b95e4e50bbd654c51f61db8f1aaca6e8958ce55127361263234a95d0a479c99f5b'
            '9b5cd5a1685354feadb6bc71484a972f4900c92488a627320e89808167888645d20f18ceec49f70414485f28c70bbea4d7bb1fe64639543432a7f646d06f9e1d'
            'd5310a647492448777ceae0a098064d82982c1ef866bc462418fe124a1955d50251f98932630d37f7e92f455b4e0bcaaf03200916421d4f9a59a3c5b508870a5'
            'e4c3f68681d8e5710a6f4b385ddbf2229e12e01cbcd89669dfc2cc1eef1227296d343a5f4b5ecb41b237c47f261d5e38c00e5fcda3284a8ac957316f9cf846f7'
            'ef8483823e69c9f10b3ea6634e3ef7c916a5562623064119afb202904fa89f9622346cb519be3c918a1a2998bcd40ec7fb9ae8f83896d7eed8a56f005633ee0f')

package() {
  install -Dm644 "$srcdir/chkcryptoboot.conf"	   "$pkgdir/etc/default/chkcryptoboot.conf"
  install -Dm644 "$srcdir/chkcryptoboot_hook"      "$pkgdir/usr/lib/initcpio/hooks/chkcryptoboot"
  install -Dm644 "$srcdir/chkcryptoboot_install"   "$pkgdir/usr/lib/initcpio/install/chkcryptoboot"
  install -Dm755 "${srcdir}"/chkcryptoboot-profilealert.sh "${pkgdir}"/etc/profile.d/chkcryptoboot-profilealert.sh
}
