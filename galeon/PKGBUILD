# Maintainer: M Rawash <mrawash@gmail.com>
pkgname=galeon
pkgver=2.0.7
pkgrel=4
pkgdesc="A GNOME web browser based on the gecko rendering engine."
arch=('i686' 'x86_64')
license=('GPL2')
url="http://galeon.sourceforge.net/"
depends=('xulrunner' 'gnome-desktop2' 'libgnomeui')
makedepends=('intltool' 'rarian')
install=galeon.install
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.bz2
		0001-Use-existing-network-status-icons-for-the-online-off.patch
		0001-Workaround-embed-missing-crash.patch
		0001-Workaround-tab-label-related-crashes.patch
		galeon-1.3.2-home.patch
		galeon-2.0.7-bug418439.patch
		galeon-2.0.7-dfltfont.patch
		galeon-2.0.7-dockcrash.patch
		galeon-2.0.7-fix-str-fmt.patch
		galeon-2.0.7-gtkprint.patch
		galeon-2.0.7-jsconsole.patch
		galeon-2.0.7-libX11.patch
		galeon-2.0.7-moz191.patch
		galeon-2.0.7-moz192.patch
		galeon-2.0.7-nojavaconsole.patch
		galeon-2.0.7-plugins.patch
		galeon-2.0.7-spinnericon.patch
		galeon-2.0.7-warnings.patch)
    
md5sums=('2eede1f43e3f6f2ac4ce7d4db99b15b2'
         '072908a08c97b7c81c8e3c8e20fe5d8b'
         '9c6cb38afa338a3b5ac958d12706d5d9'
         'eee36e6e0e8ebc31aee0da795ac8b437'
         'f66b400a289635eeb14b81d1ff9f8cb2'
         'a8deccf54f338323779a681f19859156'
         'fc614d8566786ccd2430389206f09951'
         'c9d268fa1866eb639f3e47ada044abb8'
         '549beb4ad8c2184d0395118b370bc39a'
         'f3425bdfa8026f5c6fa0bc22f6fd9f67'
         'd6eab3051b8913e12b3d2c1400b93150'
         '1a9d0935c44978d66209001143171899'
         'c49b56656176690dad64c0a6f94169a1'
         'd455fc971281daf97fbf5ad9fc7c279d'
         '747808438b97ef5d38cec56f189a24db'
         'e158a610c6aeee8f15dd89c5fb811723'
         'c658c1d7bdf598e12e5aae701d7f9832'
         '047188ae6d679b5922b016d0b563f0d8')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  for i in `ls ${srcdir}/*.patch`; do
    patch -Np1 -i ${i} || return 1
  done

  sed -i s/libxul-embedding-unstable/libxul/ configure.in || return 1
  sed -i s/TextZoom/FullZoom/ mozilla/GaleonWrapper.cpp || return 1

  autoreconf -fi || return 1
  ./configure --prefix=/usr -sysconfdir=/etc \
              --disable-nautilus-view \
              --disable-werror \
              --disable-dependency-tracking \
              --with-mozilla=libxul

  make CXXFLAGS='-std=gnu++0x'|| return 1
  make  GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir" install || return 1

  #gconf schema
  install -m755 -d "$pkgdir"/usr/share/gconf/schemas
  gconf-merge-schema "$pkgdir"/usr/share/gconf/schemas/${pkgname}.schemas \
                        "$pkgdir"/etc/gconf/schemas/*.schemas || return 1
  rm -f "$pkgdir"/etc/gconf/schemas/*.schemas

  #docs
  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}
  cp {AUTHORS,ChangeLog,NEWS,README*,INSTALL,THANKS,TODO,FAQ*} ${pkgdir}/usr/share/doc/${pkgname}
}
