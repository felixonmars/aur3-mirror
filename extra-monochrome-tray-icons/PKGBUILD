# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Shane Lazar <shane@archlinux.us>
pkgname=extra-monochrome-tray-icons
pkgver=0.6
pkgrel=2
epoch=
pkgdesc="Extra monochrome system tray icons for KDE4"
arch=(any)
url="http://kde-look.org/content/show.php/Extra+Monochrome+Tray+Icons?content=148931"
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=Changelog
source=('http://kde-look.org/CONTENT/content-files/148931-icons.tar.gz')
noextract=()
md5sums=('ff8fe1656b144cb7d94ec436847f7dec') #generate with 'makepkg -g'

build() {
#  cd "$srcdir/$pkgname-$pkgver"
#  ./configure --prefix=/usr
#  make
  cd ${srcdir}
  install -dv ${pkgdir}/usr/share/apps/desktoptheme/default/icons/
  rm ${srcdir}/network.svgz ${srcdir}/notification.svgz
  install --mode=644 ${srcdir}/*.svgz --target-directory=${pkgdir}/usr/share/apps/desktoptheme/default/icons/
  install --mode=644 ${srcdir}/*.png --target-directory=${pkgdir}/usr/share/apps/desktoptheme/default/icons/
  install --mode=644 ${srcdir}/*.gif --target-directory=${pkgdir}/usr/share/apps/desktoptheme/default/icons/
}

#check() {
#  cd "$srcdir/$pkgname-$pkgver"
#  make -k check
#}

#package() {
#  cd "$srcdir/$pkgname-$pkgver"
#  make DESTDIR="$pkgdir/" install
#}

# vim:set ts=2 sw=2 et:
