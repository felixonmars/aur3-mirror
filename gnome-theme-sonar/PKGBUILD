# Maintainer: Link Dupont <link.dupont@gmail.com>
# Contributor: Lukas Jirkovsky <l DOT jirkovsky AT gmail DOT com>

pkgname=gnome-theme-sonar
replaces=('gtk2-theme-sonar')
conflicts=('gtk2-theme-sonar')
pkgver=11.3.0_35.1
_realver=11.3.0
_iconthemever=11.3.1
_pkgver=11.3.0-35.1
pkgrel=1
pkgdesc="Default GNOME theme from openSUSE 11.3"
arch=('any')
url="http://www.opensuse.org/"
license=('GPL')
depends=('gtk-engine-murrine')
provides=('sonar-icon-theme' 'gtk2-theme-sonar')
makedepends=('rpmextract')
source=(http://download.opensuse.org/repositories/GNOME:/Factory/openSUSE_Factory/src/gtk2-metatheme-sonar-${_pkgver}.src.rpm)
md5sums=('290957ad22cd7ce021139b33f29d63e5')

build() {
  cd "$srcdir"

  rpmextract.sh gtk2-metatheme-sonar-${_pkgver}.src.rpm
  tar -xf metatheme-Sonar-${_realver}.tar.bz2
  tar -xf icon-theme-sonar-${_iconthemever}.tar.bz2

  install -m 755 -d "$pkgdir"/usr/share/themes/Sonar
  cp -a Sonar/gtk-2.0/ "$pkgdir"/usr/share/themes/Sonar
  cp -a Sonar/metacity-1/ "$pkgdir"/usr/share/themes/Sonar
  cp -a Sonar/index.theme "$pkgdir"/usr/share/themes/Sonar

  cd icon-theme-sonar-${_iconthemever}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install || return 1
  rm $pkgdir/usr/share/themes/Sonar/metacity-1/Makefile*

  chown -R root:root "$pkgdir"
}

# vim:set ts=2 sw=2 et:
