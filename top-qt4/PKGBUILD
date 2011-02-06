pkgname=top-qt4
pkgver=2.0.6
_pkgsuffix=0
pkgrel=1
pkgdesc="A windowed version of the console top command for Qt4"
arch=('i686' 'x86_64')
url="http://www.phenix.bnl.gov/WWW/publish/hpereira/software/index.php?page=package&package_list=software_list_qt4&package=Top-qt4&full=0"
license=('GPL')
depends=('lib32-qt' 'lib32-gcc-libs')
# options=(!makeflags)
source=(http://www.phenix.bnl.gov/WWW/publish/hpereira/software/rpm/Top-qt4_$pkgver-$_pkgsuffix.i586.rpm)

build() {
  install -Dm644 ${startdir}/Top-Qt4.desktop ${pkgdir}/usr/share/applications/Top-Qt4.desktop

  cd $startdir/src
  rpmextract.sh Top-qt4_$pkgver-$_pkgsuffix.i586.rpm || return 1

  install -Dm755 usr/bin/Top ${pkgdir}/usr/bin/Top || return 1
  install -Dm755 usr/share/doc/Top/COPYING ${pkgdir}/usr/share/doc/Top/COPYING || return 1
}

md5sums=('db8256c9e1f8660451b80fbef9f901c3')
