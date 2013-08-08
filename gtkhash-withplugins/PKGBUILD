# First maintainer: Jan Böhringer <janboe@gmail.com>
# Forked maintainer GI_Jack<GI_Jack@hushmail.com>

## READ THE COMMENTS THEY ARE INSTRUCTIONS ##


#modified packagebuild found on AUR with the following.
# added kernel crypto support
# added mcrypt support
# added plugins for nautilus(gnome) and thunar(xfce) file managers

pkgbase=gtkhash
pkgname=gtkhash-withplugins
pkgver=0.6.0
pkgrel=5
pkgdesc="A GTK+ utility for computing message digests or checksums.(with filemanager plugins)"
arch=('i686' 'x86_64' 'mips64el')
url="http://gtkhash.sourceforge.net/"
license=('GPL')

#Edit this next line, by default it will build plugins for BOTH, requiring BOTH to be installed or FAIL to compile. REMOVE which filemananager you don't NEED.
depends=('gtk3' 'gconf' 'intltool' 'zlib' 'thunar' 'nautilus' )

optdepends=('mhash')
source=(http://downloads.sourceforge.net/$pkgbase/$pkgbase-$pkgver.tar.gz
	gtkhash.desktop)

build() {
  cd ${srcdir}/$pkgbase-$pkgver

  #Remove either --enable-nautilus or --enable-thunar corresponding to your choice above. Build will FAIL if enabled FM is not installed.
  #./configure --enable-linux-crypto --enable-nautilus --enable-mhash --enable-thunar --prefix=/usr || return 1
  ./configure --enable-linux-crypto --enable-nautilus --enable-thunar --prefix=/usr || return 1
 
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${pkgbase}.schemas" --domain $pkgbase ${pkgdir}/usr/etc/gconf/schemas/*.schemas || return 1
  rm -rf ${pkgdir}/usr/etc/
  install -D -m644 ${srcdir}/gtkhash.desktop ${pkgdir}/usr/share/applications/gtkhash.desktop || return 1
}


md5sums=('71980923ccf6d11715b1d2bfc7a5dfc6'
         'baaf96833613fdc5ded1cf8e1972ba3f')
