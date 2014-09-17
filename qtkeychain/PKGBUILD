# Maintainer: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>
# Contributor: Teo Mrnjavac <teo@kde.org>
# https://github.com/zizzfizzix/pkgbuilds

# What type of build do you want?
# See http://techbase.kde.org/Development/CMake/Addons_for_KDE#Buildtypes to check what is supported.

_buildtype='Release'

pkgname=qtkeychain
pkgver=0.4
pkgrel=1
pkgdesc='Provides support for secure credentials storage.'
arch=('i686' 'x86_64' 'armv7h')
url='https://github.com/frankosterfeld/qtkeychain'
license=('BSD')
depends=('qt4')
makedepends=('cmake' 'icu')
optdepends=('kdeutils-kwalletmanager: KDE password manager' 'gnome-keyring: GNOME password manager')
source=("${pkgname}-${pkgver}.zip::https://github.com/frankosterfeld/qtkeychain/archive/${pkgver}.zip")
md5sums=('256e3606b37a2f123491ab31d4521ba0')

if [[ ! ${_buildtype} == 'Release' ]] && [[ ! ${_buildtype} == 'release' ]]; then
  options=('debug')
fi

prepare() {
    if [[ -e ${srcdir}/${pkgname}-${pkgver}-build ]]; then rm -rf ${srcdir}/${pkgname}-${pkgver}-build; fi
    mkdir ${srcdir}/${pkgname}-${pkgver}-build
}

build() {
    cd ${srcdir}/${pkgname}-${pkgver}-build
    cmake -DBUILD_WITH_QT4=on \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_INSTALL_LIBDIR=lib \
          -DCMAKE_INSTALL_LIBEXECDIR=lib/${pkgname} \
          -DCMAKE_BUILD_TYPE=${_buildtype} \
          ../${pkgname}-${pkgver}
    make
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}-build
    make DESTDIR=${pkgdir} install
    install -D -m644 ${srcdir}/${pkgname}-${pkgver}/COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
