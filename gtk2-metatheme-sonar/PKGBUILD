# Maintainer: Link Dupont <link.dupont@gmail.com>
# Contributor: Link Dupont <link.dupont@gmail.com>
# Previous contributors:
# - Javier Aravena <javier@aravenas.com>
# - Lukas Jirkovsky <l DOT jirkovsky AT gmail DOT com>

pkgbase=gtk2-metatheme-sonar
pkgname=gtk2-metatheme-sonar
true && pkgname=('gtk2-metatheme-sonar' 'sonar-icon-theme')
pkgver=11.3.0_42.1
pkgrel=2
_iconthemever=11.3.1
_iconthemepkg=icon-theme-sonar
pkgdesc="GTK+ and Metacity Sonar Theme"
arch=(any)
url="http://www.opensuse.org"
license=('GPL2')
groups=()
depends=()
makedepends=('rpmextract' 'patch' 'pkg-config' 'icon-naming-utils')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=ChangeLog
source=(http://download.opensuse.org/repositories/GNOME:/Factory/openSUSE_Factory/src/$pkgbase-${pkgver//_/-}.src.rpm)
noextract=()
md5sums=('09a417b45eda7faa2010454af678c7e8')

build() {
  cd "$srcdir"

  # Extract sources
  rpmextract.sh $pkgbase-${pkgver//_/-}.src.rpm
  tar -xf metatheme-Sonar-${pkgver%_*}.tar.bz2
  tar -xf $_iconthemepkg-$_iconthemever.tar.bz2

  # Make icon theme
  pushd $_iconthemepkg-$_iconthemever
  ./configure --prefix=/usr
  make
  popd

  # this typo is intentional
  patch -p0 < metatheme-Sonar_compatibilty-with-murrine-0.98.patch
}

package_gtk2-metatheme-sonar() {
  pkgdesc="GTK+ and Metacity theme created for openSUSE 11.2."
  depends=(gtk-engine-murrine)
  provides=(gtk2-theme-sonar)
  conflicts=(gnome-theme-sonar gtk2-theme-sonar)

  cd "$srcdir"
  install -m 755 -d "$pkgdir/usr/share/themes/Sonar"
  pushd Sonar
  cp -a gtk-2.0 metacity-1 index.theme "$pkgdir/usr/share/themes/Sonar"
  popd

  # Clean up $pkgdir
  rm "$pkgdir/usr/share/themes/Sonar/metacity-1/Makefile"
  rm "$pkgdir/usr/share/themes/Sonar/metacity-1/Makefile.am"
  rm "$pkgdir/usr/share/themes/Sonar/metacity-1/Makefile.in"
  chmod o-w "$pkgdir/usr/share/themes/Sonar/metacity-1"
  chown -R root:root "$pkgdir"
}

package_sonar-icon-theme() {
  pkgdesc="Sonar icon theme based on the upcoming GNOME icon theme."
  pkgver=11.3.1-42.1
  depends=('gnome-icon-theme' 'hicolor-icon-theme')
  install=sonar-icon-theme.install

  cd "$srcdir/$_iconthemepkg-$_iconthemever"
  make DESTDIR="$pkgdir/" install

  # Debrand the SUSE/Novell images
  cd "$pkgdir/usr/share/icons/Sonar"
  for i in 16x16 22x22 24x24 32x32 48x48;do
    rm $i/places/gnome-main-menu.png\
       $i/places/novell-button.png\
       $i/places/start-here.png\
       $i/places/distributor-logo.png
  done
}
