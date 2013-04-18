# Maintainer : josephgbr <rafael.f.f1@gmail.com>

_pkgname="gparted"
pkgname="${_pkgname}-git"
pkgver=0.15.0.42.g633cba4
pkgrel=1
pkgdesc="GNOME Partition Manager, frontend to GNU Parted - GIT Version"
arch=('i686' 'x86_64')
url="http://gparted.sourceforge.net"
license=('GPL')
depends=('parted' 'gtkmm' 'libsigc++' 'hicolor-icon-theme')
makedepends=('intltool' 'pkg-config' 'gnome-doc-utils' 'gnome-common' 'git')
optdepends=('e2fsprogs: for ext2/ext3 partitions'
      'dosfstools: for fat16/32 partitions'
      'jfsutils: for jfs partitions'
      'ntfsprogs: for ntfs partitions'
      'reiserfsprogs: for reiserfs partitions'
      'hfsprogs: for hfs+ partitions'
      'xfsprogs: for xfs partitions'
      'polkit: to run gparted directly from menu'
      'gpart: for recovering corrupt partition tables'
      'mtools: for manipulating FAT fs image files')

install="${pkgname}.install"
conflicts=("${_pkgname}")
provides=("${_pkgname}")

source=("git://git.gnome.org/${_pkgname}"
        'org.archlinux.pkexec.gparted.policy'
        'gparted-pkexec.in')

sha256sums=('SKIP'
            '5e0d15ae1c182dfc21c5a6a4cd5ebc010311c6c46d8bc3d67d20d55253840fe2'
            '868ad1960ee496ddf2f854a0609ee062536fa222d2f987a7f96cc4d9d6317ac3')

pkgver() {
  cd ${_pkgname}
  git describe --always | sed 's|-|.|g' | sed 's|_|.|g' | cut -d'.' -f2-
}

build() {
  cd ${_pkgname}
  ./autogen.sh --prefix="/usr"
  make
}

package() {  
  cd ${_pkgname}  
  make DESTDIR="${pkgdir}" install
  
  ## Install policy file
  install -D -m0644 "${srcdir}/org.archlinux.pkexec.gparted.policy" "${pkgdir}/usr/share/polkit-1/actions/org.archlinux.pkexec.gparted.policy"
  
  ## Install launcher script
  install -d "${pkgdir}/usr/bin/"
  install -D -m0755 "${srcdir}/gparted-pkexec.in" "${pkgdir}/usr/bin/gparted-pkexec"
  
  ## Modify desktop file
  sed -e "s/Exec=.*/Exec=gparted-pkexec/" -i "${pkgdir}/usr/share/applications/gparted.desktop"
  
}
