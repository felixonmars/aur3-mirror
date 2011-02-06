# $Id: PKGBUILD 7497 2010-01-07 03:29:37Z dgriffiths $
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
pkgname=scigraphica
pkgver=2.1.0
pkgrel=7
pkgdesc="A scientific application for data analysis and technical graphics"
arch=('i686' 'x86_64')
url="http://scigraphica.sourceforge.net/"
license=('GPL')
depends=('imlib' 'libxml2' 'libscigraphica' 'perl-xml-simple')
makedepends=()
options=('!libtool')
source=(http://downloads.sourceforge.net/scigraphica/${pkgname}-${pkgver}.tar.gz)
md5sums=('80b74b2faa0e2c46361f4de51e73df34')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr --with-python-numeric-path=/usr/include/python2.5/numarray --mandir=/usr/share
  make || return 1
  make DESTDIR=${pkgdir} install

  # fix conflict with libscigraphica
  rm -r ${pkgdir}/usr/share/pixmaps/sg_icon.xpm
  # fix freedesktop complaince
  mkdir -p ${pkgdir}/usr/share/applications
  mv ${pkgdir}/usr/share/gnome/apps/Applications/sg.desktop \
  	${pkgdir}/usr/share/applications
  echo "Categories=Application;Science" >> ${pkgdir}/usr/share/applications/sg.desktop
  # delete docs
  rm -r ${pkgdir}/usr/share/gnome

  # fix .desktop file
  sed -i "s|Exec=sga|Exec=scigraphica|g" ${pkgdir}/usr/share/applications/sg.desktop
}
# vim:syntax=sh
