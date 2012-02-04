# Maintainer: PyroPeter <abi1789@com.googlemail>
# Contributor: AndyRTR <andyrtr@archlinux.org>

pkgname=ghostscript-svn
pkgver=0
pkgrel=2
pkgdesc="An interpreter for the PostScript language"
arch=('i686' 'x86_64')
license=('GPL3' 'custom')
depends=('libxext' 'libxt' 'libcups>=1.4.2-3' 'fontconfig>=2.8.0' 'gnutls>=2.8.5' 'cairo>=1.8.8-2'
          'jasper>=1.900.1-4' 'zlib' 'libpng>=1.4.0' 'libjpeg>=8' 'libidn')
makedepends=('subversion' 'automake' 'autoconf' 'gtk2>=2.18.6')
optdepends=('texlive-core:	dvipdf'
            'gtk2:		gsx')
replaces=('ghostscript-lrpng')
provides=('ghostscript=9.01' 'ghostscript-lprng')
conflicts=('ghostscript')
url="http://www.ghostscript.com/"
source=(ghostscript-fPIC.patch)
options=('!libtool' '!makeflags')
md5sums=('766d44c47c693f96941b658e360c1277')

_svntrunk=http://svn.ghostscript.com/ghostscript/trunk/gs
_svnmod=gs

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"


  # force it to use system-libs
  rm -rf jpeg libpng zlib jasper expat

  if [ "$CARCH" = "x86_64" ]; then
    patch -Np1 -i ${srcdir}/ghostscript-fPIC.patch || return 1
  fi

  # Build IJS
  cd ${srcdir}/gs/ijs
  ./autogen.sh
  ./configure --prefix=/usr --enable-shared --disable-static
  make || return 1
  make -j1 DESTDIR=${pkgdir} install || return 1

  cd ..
  ./autogen.sh
  ./configure --prefix=/usr --enable-dynamic --with-ijs \
              --with-jbig2dec --with-omni --with-x --with-drivers=ALL\
	      --with-fontpath=/usr/share/fonts/Type1:/usr/share/fonts \
	      --disable-compile-inits # needed for linking with system-zlib
  make || return 1
  make -j1 DESTDIR=${pkgdir} \
	cups_serverroot=${pkgdir}/etc/cups \
	cups_serverbin=${pkgdir}/usr/lib/cups install soinstall

  # install a missing doc files # http://bugs.archlinux.org/task/18023
  install -m 644 ${srcdir}/gs/doc/{Ps2ps2.htm,gs-vms.hlp,gsdoc.el,pscet_status.txt} ${pkgdir}/usr/share/ghostscript/*/doc/
  
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  install -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/

  # remove unwanted localized man-pages
  rm -rf "$pkgdir"/usr/share/man/[^man1]*
}
