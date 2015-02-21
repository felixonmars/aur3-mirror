#! /bin/bash
# Maintainer: Fabien Bourigault <bourigaultfabien@gmail.com>
# Contributor: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: onestep_ua <onestep@ukr.net>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>
# Contributor: lh <jarryson#gmail.com>
# Based on packagekit PKGBUILD by Jonathan Conder <jonno.conder@gmail.com>

pkgname=packagekit-git
pkgver=PACKAGEKIT_1_0_5.r5.g0b2f0c7
pkgrel=1
pkgdesc="A system designed to make installing and updating software on your computer easier"
arch=('i686' 'x86_64')
backup=('var/lib/PackageKit/transactions.db'
        'etc/PackageKit/alpm.d/pacman.conf'
        'etc/PackageKit/alpm.d/repos.list')
url="http://packagekit.org/"
license=('GPL')
depends=('dbus-glib' 'pacman' 'polkit' 'shared-mime-info' 'sqlite')
makedepends=('dbus-glib' 'gobject-introspection' 'gtk-doc' 'intltool'
             'networkmanager' 'pacman>=4.2.0'  'pm-utils' 'polkit'
             'shared-mime-info' 'sqlite' 'bash-completion')
optdepends=('networkmanager: detect connection status'
            'bash-completion: command completion in bash')
source=(git+https://github.com/hughsie/PackageKit)
install='packagekit.install'
options=('!libtool')
provides=('packagekit')
conflicts=('packagekit')
sha512sums=('SKIP')

_gitname="PackageKit"

pkgver() {
  cd ${_gitname}
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd ${_gitname}

  ./autogen.sh --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib/PackageKit \
    --disable-static \
    --disable-gtk-doc \
    --disable-local \
    --disable-browser-plugin \
    --disable-gstreamer-plugin \
    --disable-gtk-module \
    --disable-command-not-found \
    --disable-cron \
    --disable-dummy \
    --enable-alpm
  make
}

package() {
  cd "${_gitname}"

  # install directory with polkit's owner and permission
  install -d -m0700 -o 102 "${pkgdir}"/usr/share/polkit-1/rules.d

  make DESTDIR="${pkgdir}" install
}
