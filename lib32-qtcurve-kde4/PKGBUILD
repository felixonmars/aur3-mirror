# Contributor: mightyjaym <jm.ambrosino@free.fr>
# Maintainer: Dany Martineau <dany.luc.martineau at gmail.com>
# Contributor: <Tilo Brueckner>  blueperil@gmx.de

pkgname=lib32-qtcurve-kde4
pkgver=1.8.12
pkgrel=1
pkgdesc='A configurable set of widget styles for KDE and Gtk'
arch=('x86_64')
url='http://www.kde-look.org/content/show.php?content=40492'
depends=('lib32-gtk2')
license='GPL'
groups=('lib32')
source=(http://ftp5.gwdg.de/pub/linux/archlinux/community/os/i686/${pkgname/lib32-/}-${pkgver}-1-i686.pkg.tar.xz)
md5sums=('8ab5f850def12a74a1fdab910cdcbbed')

build() {
  mkdir -p ${pkgdir}/usr/lib32/kde4/plugins/styles
  cp -R ${srcdir}/usr/lib/kde4/plugins/styles/*.so*  ${pkgdir}/usr/lib32/kde4/plugins/styles
}
