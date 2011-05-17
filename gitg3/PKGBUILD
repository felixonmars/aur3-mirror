# Maintainer: Blaž Tomžič <blaz.tomazic@gmail.com>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: M Rawash <mrawash@gmail.com>
# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=gitg3
_realpkgname=gitg
pkgver=0.2.2
pkgrel=2
pkgdesc='A GIT repository viewer based on GTK+'
arch=('i686' 'x86_64')
url='http://trac.novowork.com/gitg/'
license=('GPL')
depends=('dconf' 'gtksourceview3' 'git' 'desktop-file-utils' 'gsettings-desktop-schemas')
makedepends=('intltool')
conflicts=('gitg')
install="${_realpkgname}.install"
source=("ftp://ftp.gnome.org/pub/GNOME/sources/gitg/0.2/${_realpkgname}-${pkgver}.tar.bz2")
sha256sums=('cfa1b1d2bdd1211c09e00dca42130ea98e98fde576d85e18eabfde1802d0d04a')

build() {
  	cd ${_realpkgname}-${pkgver}

  	./configure \
    		--prefix=/usr
  	make
}

package() {
  	cd ${_realpkgname}-${pkgver}

  	make DESTDIR=${pkgdir} install
}
