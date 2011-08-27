# Contributor: Jakub Schmidtke <sjakub-at-gmail.com>

pkgname=startcrypt
pkgver=0.3
pkgrel=2
pkgdesc="Boot menu for opening volumes encrypted with truecrypt or LUKS (based on network profile menu)"
arch=('i686' 'x86_64')
url="http://aur.archlinux.org/packages.php?K=startcrypt"
license=('GPL')
install=('startcrypt.install')
source=('crypt' 'cryptcfg' 'template')
replaces=('truecrypt-start')
conflicts=('truecrypt-start')
md5sums=('7f14d2a9a5c4d2b30c63cf2ec1e21deb'
         '8250b2f4a1dd6081e010fa3e471d29f7'
         'fa5b2bd4c8b9ab119de97067c1d1d908')

build() {
  cd $startdir/src
  
  # Install files
  install -Dm755 crypt $startdir/pkg/etc/rc.d/crypt
  install -Dm755 cryptcfg $startdir/pkg/usr/sbin/cryptcfg
  install -Dm644 template $startdir/pkg/etc/crypt-profiles/template
}
