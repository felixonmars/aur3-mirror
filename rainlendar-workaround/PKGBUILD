# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: ronny <ronny63@gmail.com>
# Contributor: Massimiliano Brocchini <proc80@gmail.com>
# Contributor: twa022 <twa022@gmail.com>

pkgname=rainlendar-workaround
pkgver=2.6
pkgrel=1
pkgdesc="A desktop Calendar, ToDo list and Event list."
arch=('i686' 'x86_64')
url="http://www.rainlendar.net/"
# Tips on setting different GTK theme per app
#url="http://urukrama.wordpress.com/2008/07/13/setting-a-custom-gtk-theme-for-specific-applications/"
# Discussion of this error on Forums
#url="http://bbs.archlinux.org/viewtopic.php?id=65928&p=1"
license=('custom')
depends=('gtk2>=2.0' 'glibc>=2.3.2' 'expat>=1.95.8' 'libstdc++5' 'gnome-themes')
provides=('rainlendar2')
conflicts=('rainlendar-beta' 'rainlendar-lite')

[ "${CARCH}" = 'x86_64' ] && _arch=amd64 && md5sums=('514af87ab8879a32f859aee2ee8a05c2')
[ "${CARCH}" = 'i686' ] && _arch=i386 && md5sums=('4584d71231d8212ef0039928b3c541ce')
source=("http://www.rainlendar.net/download/Rainlendar-Lite-$pkgver-$_arch.tar.bz2"
        'gtkrc-2.0-rainlendar'
        'rainlendar')
md5sums=(${md5sums[*]} 'b18f3feba543693e0072a4e08ef84f44' '1eceda3c9a74da3beb9a7013f49eee7c')


build() {
  install -d "${pkgdir}/opt" "${pkgdir}/usr/bin" "${pkgdir}/usr/share/licenses/$pkgname"

  cp -R "${srcdir}/rainlendar2" "${pkgdir}/opt"
  
#  ln -s "/opt/rainlendar2/rainlendar2" "${pkgdir}/usr/bin/rainlendar"
  install -m755 rainlendar $pkgdir/usr/bin
  install -m644 gtkrc-2.0-rainlendar $pkgdir/opt/rainlendar2
  ln -s "/opt/rainlendar2/License.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
