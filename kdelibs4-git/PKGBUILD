pkgname=kdelibs4-git
_gitname=kdelibs
pkgver=v4.10.2.241.g137c4d5
pkgrel=1
pkgdesc="KDE Core Libraries"
arch=('i686' 'x86_64')
url='http://www.kde.org'
license=('LGPL')
depends=('strigi-git' 'attica-git' 'libxss' 'soprano-git' 'krb5' 'grantlee'
        'shared-desktop-ontologies' 'qca' 'libdbusmenu-qt' 'polkit-qt-git'
        'shared-mime-info' 'enchant' 'giflib' 'jasper' 'openexr' 'herqq'
        'docbook-xsl' 'upower' 'udisks2' 'libxcursor' 'phonon-git'
        'media-player-info' 'libxtst' 'libutempter' 'qtwebkit')
makedepends=('git' 'cmake' 'automoc4' 'avahi' 'libgl' 'hspell' 'mesa')
conflicts=('kdelibs')
provides=('kdelibs')
groups=('kde-git')
source=('git://anongit.kde.org/kdelibs'
	'kde-applications-menu.patch'
	'archlinux-menu.patch')
md5sums=('SKIP'
         '2b30cc3e382e99333e7ff388943473e9'
         'a2c351e5c4d5bef39865e5fc1a39219a')
install=${pkgname}.install

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}

build() {
  cd $srcdir
  
  msg "GIT checkout done"
  msg "Starting make..."
  if [[ -d ${srcdir}/build ]]; then
    msg "Cleaning the previous build directory..."
    rm -rf ${srcdir}/build
  fi
  cp $srcdir/$_gitname $srcdir/build
  cd $srcdir/build
  patch -p1 -i "${srcdir}"/kde-applications-menu.patch
  patch -p1 -i "${srcdir}"/archlinux-menu.patch

  cmake . -DCMAKE_BUILD_TYPE=debugfull \
		-DKDE4_BUILD_TESTS=OFF \
		-DCMAKE_SKIP_RPATH=ON \
		-DKDE_DISTRIBUTION_TEXT='Arch Linux' \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DSYSCONF_INSTALL_DIR=/etc \
		-DHTML_INSTALL_DIR=/usr/share/doc/kde/html \
		-DKDE_DEFAULT_HOME='.kde4git' \
		-DWITH_FAM=OFF \
		-DWITH_HUpnp=ON \
		-DWITH_SOLID_UDISKS2=ON \
		-DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
  rm -f "${pkgdir}"/usr/share/apps/kssl/ca-bundle.crt
  ln -sf /etc/ssl/certs/ca-certificates.crt "${pkgdir}"/usr/share/apps/kssl/ca-bundle.crt
}
