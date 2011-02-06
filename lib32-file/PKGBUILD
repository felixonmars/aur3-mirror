#Contributor:Xemertix <arch88(at)katamail(dot)com>

namedest=file
pkgname=lib32-file
pkgver=5.04
pkgrel=1
pkgdesc="File type identification utility (32 bit)"
arch=('x86_64')
license=('custom')
url="http://www.darwinsys.com/file/"
depends=('lib32-zlib')
options=('!libtool')
source=(ftp://ftp.astron.com/pub/${namedest}/${namedest}-${pkgver}.tar.gz 
        file-5.04-python-2.7.patch
        file-5.04-zip64.patch)
md5sums=('accade81ff1cc774904b47c72c8aeea0' 
         '4f223a3ff4f157320f1e6faffc4afb88'
         'b547eb3430adb3deb756d3a43dd7ad46')

build() {
  cd "${srcdir}/${namedest}-${pkgver}"

  sed -i 's#\$(datadir)/misc#\$(datadir)#' configure 

  # identify python 2.7 byte-compiled files
  patch -Np1 -i ../file-5.04-python-2.7.patch

  # identify zip64 files
  patch -Np1 -i ../file-5.04-zip64.patch

  export ABI="32"
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  ./configure --prefix=/usr --libdir=/usr/lib32 --datadir=/usr/share/file
  make 
  make DESTDIR=${pkgdir} install

  rm -r ${pkgdir}/usr/{bin,include,share}
}

