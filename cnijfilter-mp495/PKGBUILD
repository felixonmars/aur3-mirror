# Contributor: fledge (Giorgio Daino) <giorgio.daino@gmail.com>
# Special thanks to: Alessio Fachechi, olive, mirrr, GUiHKX, jeremy33

pkgname=cnijfilter-mp495
pkgver=3.40.1
pkgrel=1
_pkgrealver=3.40
_pkgrealrel=1
pkgdesc="Canon IJ Printer Driver (MP495 series)"
url="http://www.canon-europe.com/Support/Consumer_Products/products/Fax__Multifunctionals/InkJet/PIXMA_MP_series/MP495.aspx"
arch=('i686' 'x86_64')
license=('custom')
depends=('libcups' 'cups' 'popt' 'ghostscript' 'gsfonts' 'atk>=1.9.0' 'gtk2>=2.8.0' 'pango>=1.12.3' 'libpng>=1.2.8' 'libtiff' 'cairo>=1.0.2' 'libxml2>=2.6.24' 'fontconfig>=2.3.0' 'libxinerama')
makedepends=('autoconf>=2.13' 'automake>=1.6' 'tar' 'make' 'gcc')
conflicts=('cnijfilter-common')
install=cnijfilter-mp495.install
source=('http://files.canon-europe.com/files/soft40245/software/cnijfilter-source-3.40-1.tar.gz'
        'fix.patch'
        'libpng.patch')
md5sums=('609975a05d6050fcca88f312d3f35c6a'
         'd8dd2d723a15681a6092d506b5106047'
         '15e417cd427a920c83e4f28e225e428e')

printer_model=mp495
printer_code=369

build() {
  cd ${srcdir}/cnijfilter-source-${_pkgrealver}-${_pkgrealrel}/
  patch -p0 < ${srcdir}/fix.patch
  patch -p0 < ${srcdir}/libpng.patch

  cd ${srcdir}/cnijfilter-source-${_pkgrealver}-${_pkgrealrel}/libs
  ./autogen.sh --prefix=/usr --program-suffix=${printer_model}
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-source-${_pkgrealver}-${_pkgrealrel}/cngpij
  ./autogen.sh --prefix=/usr --program-suffix=${printer_model} --enable-progpath=/usr/bin
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-source-${_pkgrealver}-${_pkgrealrel}/cnijfilter
  ./autogen.sh --prefix=/usr --program-suffix=${printer_model} --enable-progpath=/usr/bin
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-source-${_pkgrealver}-${_pkgrealrel}/pstocanonij
  ./autogen.sh --prefix=/usr --program-suffix=${printer_model} --enable-progpath=/usr/bin
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-source-${_pkgrealver}-${_pkgrealrel}/lgmon
  ./autogen.sh --prefix=/usr --program-suffix=${printer_model} --enable-progpath=/usr/bin
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-source-${_pkgrealver}-${_pkgrealrel}/ppd
  ./autogen.sh --prefix=/usr --program-suffix=${printer_model}
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-source-${_pkgrealver}-${_pkgrealrel}/cngpijmon/cnijnpr
  ./autogen.sh --prefix=/usr --program-suffix=${printer_model} --enable-progpath=/usr/bin LIBS="-ldl"
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-source-${_pkgrealver}-${_pkgrealrel}/backend
  ./autogen.sh --prefix=/usr --program-suffix=${printer_model} --enable-progpath=/usr/bin
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-source-${_pkgrealver}-${_pkgrealrel}/backendnet
  ./autogen.sh --prefix=/usr --program-suffix=${printer_model} --enable-progpath=/usr/bin
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-source-${_pkgrealver}-${_pkgrealrel}
  install -d ${pkgdir}/usr/lib/bjlib
  install -m 755 ${printer_code}/database/* ${pkgdir}/usr/lib/bjlib

  if [ "$CARCH" == "x86_64" ]; then  
    libdir=libs_bin64
  else
    libdir=libs_bin32
  fi
  install -m 755 ${srcdir}/cnijfilter-source-${_pkgrealver}-${_pkgrealrel}/${printer_code}/${libdir}/libcnbpcmcm${printer_code}.so.8.0.1 ${pkgdir}/usr/lib/
  install -m 755 ${srcdir}/cnijfilter-source-${_pkgrealver}-${_pkgrealrel}/${printer_code}/${libdir}/libcnbpcnclapi${printer_code}.so.3.5.0 ${pkgdir}/usr/lib/
  install -m 755 ${srcdir}/cnijfilter-source-${_pkgrealver}-${_pkgrealrel}/${printer_code}/${libdir}/libcnbpcnclbjcmd${printer_code}.so.3.3.0 ${pkgdir}/usr/lib/
  install -m 755 ${srcdir}/cnijfilter-source-${_pkgrealver}-${_pkgrealrel}/${printer_code}/${libdir}/libcnbpcnclui${printer_code}.so.3.6.0 ${pkgdir}/usr/lib/
  install -m 755 ${srcdir}/cnijfilter-source-${_pkgrealver}-${_pkgrealrel}/${printer_code}/${libdir}/libcnbpess${printer_code}.so.3.3.3 ${pkgdir}/usr/lib/
  install -m 755 ${srcdir}/cnijfilter-source-${_pkgrealver}-${_pkgrealrel}/${printer_code}/${libdir}/libcnbpess${printer_code}.so.3.3.3 ${pkgdir}/usr/lib/
  install -m 755 ${srcdir}/cnijfilter-source-${_pkgrealver}-${_pkgrealrel}/${printer_code}/${libdir}/libcnbpo${printer_code}.so.1.0.2 ${pkgdir}/usr/lib/
  install -m 755 ${srcdir}/cnijfilter-source-${_pkgrealver}-${_pkgrealrel}/com/${libdir}/libcnnet.so.1.2.0 ${pkgdir}/usr/lib/
  cd ${pkgdir}/usr/lib/
  ln -s libcnbpcmcm${printer_code}.so.8.0.1 libcnbpcmcm${printer_code}.so
  ln -s libcnbpcnclapi${printer_code}.so.3.5.0 libcnbpcnclapi${printer_code}.so
  ln -s libcnbpcnclbjcmd${printer_code}.so.3.3.0 libcnbpcnclbjcmd${printer_code}.so
  ln -s libcnbpcnclui${printer_code}.so.3.6.0 libcnbpcnclui${printer_code}.so
  ln -s libcnbpess${printer_code}.so.3.3.3 libcnbpess${printer_code}.so
  ln -s libcnbpo${printer_code}.so.1.0.2 libcnbpo${printer_code}.so
  ln -s libcnnet.so.1.2.0 libcnnet.so
  
  cd ${srcdir}/cnijfilter-source-${_pkgrealver}-${_pkgrealrel}
  install -D LICENSE-cnijfilter-${_pkgrealver}EN.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-cnijfilter-${_pkgrealver}EN.txt
}
