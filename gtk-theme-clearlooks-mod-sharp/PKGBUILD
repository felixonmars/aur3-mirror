# Contributor: Václav Kramář <vaclav.kramar@tiscali.cz>

pkgname=gtk-theme-clearlooks-mod-sharp
pkgver=20091212
pkgrel=1
pkgdesc="Squared Clearlooks theme modification."
arch=('any')
url="http://www.xfce-look.org/content/show.php/Clearlooks+Mod+Sharp+for+OpenBox?content=116931"
license=('GPL')
depends=('gtk-engines')
builddepends=('xz-utils')
source=(http://www.xfce-look.org/CONTENT/content-files/116931-Clearlooks-sharp.tar.xz)
md5sums=('62b75ccda098ab54e9d7aa2ed56489ec')

build() {
  install -d ${pkgdir}/usr/share/themes || return 1
  cp -r ${srcdir}/Clearlooks-sharp ${pkgdir}/usr/share/themes || return 1
}
