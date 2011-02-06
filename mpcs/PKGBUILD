# Contributor: <fedoseev2004@yahoo.com>
pkgname=mpcs
pkgver=0.9e
pkgrel=4
pkgdesc="MPCS cardsharing program with NTV+ fix and big groups"
arch=('i686')
url="http://streamboard.gmc.to"
license=('GPL')
groups=()
depends=()
provides=()
conflicts=()
replaces=()
backup=('etc/mpcs/mpcs.*')
options=()
source=("mpcs-pre_0.9e_Community_edition.tar.bz2" 
    "ntv_des.c.patch"
    "ntv_module-newcamd.c.patch"
    "groups64.patch")
noextract=()
md5sums=('ad302b4ff701978b81b3f2c9af8633ba'
         '06ab7edc9bf33289d5a836777104eb94'
	 '6a0c2b15f85aa0ed987206f07715ca69'
	 '6026c2a9c312096cdbe7bda644a6c86c')

build() {
  cd "$srcdir/mpcs-pre_0.9e_Community_edition"
  patch -p0 -i ../ntv_des.c.patch || return 1
  patch -p0 -i ../ntv_module-newcamd.c.patch || return 1
  patch -p0 -i ../groups64.patch || return 1
    
  make || return 1
 
  install -D -m744 Distribution/mpcs-pre_0.9e_Community_edition-i386-pc-linux ${pkgdir}/usr/sbin/mpcs

  cd ${startdir}
  mkdir -p ${pkgdir}/etc/mpcs/
  install -D -m744 rc.mpcs ${pkgdir}/etc/rc.d/mpcs
  install -D -m644 confd.mpcs ${pkgdir}/etc/conf.d/mpcs
  install -D -m644 mpcs.* ${pkgdir}/etc/mpcs/
  install -D -m644 readme-ru.txt ${pkgdir}/etc/mpcs/
}

