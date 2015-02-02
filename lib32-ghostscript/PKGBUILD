# Maintainer: quequotion <quequotion@bugmenot.com>
# Maintainer: AndyRTR <andyrtr@archlinux.org>

### !!! rebuild groff from core that picks up hardcoding the GS versioned font path !!! ###

pkgname=lib32-ghostscript
pkgver=9.14
pkgrel=1
pkgdesc="An interpreter for the PostScript language (32bit)"
arch=('i686' 'x86_64')
license=('AGPL' 'custom')
depends=(lib32-{fontconfig,jasper,zlib,lcms2,dbus,lib{xt,cups,'png>=1.5.7',jpeg,'tiff>=4.0.0',paper}})
makedepends=(lib32-{gtk3,gnutls})
optdepends=('lib32-texlive-core:      needed for dvipdf'
            'lib32-gtk3:              needed for gsx')
url="http://www.ghostscript.com/"
source=(http://downloads.ghostscript.com/public/ghostscript-${pkgver}.tar.bz2
        ghostscript-sys-zlib.patch)
#options=('!makeflags')
sha512sums=('c2188a2b1fbd96ec184cd4171f0c042a9479f89d6e982aaf079d56060df6061721a42b1b98923767dba8081497d8e85593896fb3c26fc35f99610461bf8f16bb'
            '19b14244d775c08fb189df9a56eacd1dad04fbcac86fa4097a36384ea143de240d79b39483d50cffbcb8f06ea6b8579fb830e467a775e6169e20a9b09bbf278d')

prepare() {
  cd ghostscript-${pkgver}
  # fix build with system zlib
  patch -Np1 -i ${srcdir}/ghostscript-sys-zlib.patch
}

build() {
  cd ghostscript-${pkgver}
  
  # force it to use system-libs
  # keep heavily patched included openjpeg, leads to segfault with system openjpeg
  # https://bugs.archlinux.org/task/38226
  rm -rf jpeg libpng zlib jasper expat tiff lcms lcms2 freetype cups/libs # jbig2dec is in community

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export LDFLAGS='-m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  export ZLIBDIR='/usr/include/'

  autoconf --force

  ./configure --prefix=/usr \
        --libdir=/usr/lib32 --libexecdir=/usr/lib32 --includedir=/usr/lib32/ghostscript/include \
	--enable-dynamic \
	--with-{ijs,jbig2dec,omni,x,libpaper,system-libtiff} \
        --with-drivers=ALL \
	--with-fontpath=/usr/share/fonts/Type1:/usr/share/fonts \
	--enable-{fontconfig,freetype,openjpeg} \
	--without-{luratech,omni} \
	--disable-compile-inits #--help # needed for linking with system-zlib
  make

  # Build IJS
  cd ijs
  sed -i "s:AM_PROG_CC_STDC:AC_PROG_CC:g" configure.ac
  ./autogen.sh
  ./configure --prefix=/usr --enable-shared --disable-static
  make
}

package() {
  cd ghostscript-${pkgver}
  make DESTDIR="${pkgdir}" \
	cups_serverroot="${pkgdir}"/etc/cups \
	cups_serverbin="${pkgdir}"/usr/lib32/cups install install-so

  # install missing doc files # http://bugs.archlinux.org/task/18023
  install -m 644 "${srcdir}"/ghostscript-${pkgver}/doc/{Ps2ps2.htm,gs-vms.hlp,gsdoc.el,pscet_status.txt} "${pkgdir}"/usr/share/ghostscript/$pkgver/doc/
  
  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

  # remove unwanted localized man-pages
  rm -rf "$pkgdir"/usr/share/man/[^man1]*

  # install IJS
  cd ijs
  make DESTDIR="${pkgdir}" install
  
  # remove filters that are now maintained in cups-filters as upstream home
  rm -rf "$pkgdir"/usr/lib32/cups/filter/{gstopxl,gstoraster}

  rm -rf "${pkgdir}"/{etc,usr/{share,include,bin,lib}} # cruft in lib/
}

