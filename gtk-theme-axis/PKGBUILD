# Contributor: Aliaksandr Stelmachonak <mail.avatar at gmail dot com>

pkgname=gtk-theme-axis
pkgver=20091019
pkgrel=2
pkgdesc="Axis gtk2 theme based on the Clearlooks, Industrial & Mist engines."
arch=('i686' 'x86_64')
url="http://xfce-look.org/content/show.php/axis+gtk?content=95157"
license=('GPL')
depends=('gtk-xfce-engine' 'gtk-engines')
source=(http://xfce-look.org/CONTENT/content-files/95157-axis-gtk.tar.gz 'nosnap.patch')
md5sums=(
	'c05896d29e2d09f0e00ad8f54c165aed'
	'994f3ecc0c4629517790aaec8e355659'
)

build() {
  cd ${srcdir}
  patch -Np0 -i ${startdir}/nosnap.patch
  install -d ${pkgdir}/usr/share/themes || return 1
  cp -r ${srcdir}/axis  ${pkgdir}/usr/share/themes || return 1
}
