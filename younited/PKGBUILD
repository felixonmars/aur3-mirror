# Mantainer: msx <archlinux.us: msx>

pkgname=younited
pkgver=2.2.10
pkgrel=1
pkgdesc="We like what Dropbox and SkyDrive do but where is the privacy and fun? younited by F-Secure provides secure, easy and fun cloud storage."
arch=( 'x86_64' )
url="http://www.younited.com/"
license=('custom')
depends=('qt5-webkit' 'xsel')
source=('https://download.sp.f-secure.com/younited/linux/younited-2.2.10-1.x86_64.rpm')
md5sums=('dfe52c4bcf034dff4dbdd6dd6387fb6c')
# I don't want to strip anything from the static libraries for now,
# I may change of idea after I thoroughly test the package. Any help is welcome!
options=(!strip)
install=install

package() {
  cd ${pkgdir}
  mv ${srcdir}/{opt,usr} .
}

