# Maintainer: Alexander Minges <alexander.minges@gmail.com>
pkgname=coot
pkgver=0.8.1
pkgrel=1
pkgdesc="Crystallographic Object-Oriented Toolkit for model building, completion and validation"
arch=('i686' 'x86_64')
url="http://lmb.bioch.ox.ac.uk/coot/"
license=('GPL')
depends=('guile1.8' 'guile1.8-lib' 'gtkglext' 'libccp4' 'clipper' 'goocanvas1' 'gsl' 'libgnomecanvas' 'imlib' 'swig'
         'freeglut' 'libgl' 'gtk2' 'cairo' 'ssmlib>=1.4' 'zlib' 'curl' 'python2' 'pygtk' 'gtkglarea' 'which' 'bc')
source=(http://www2.mrc-lmb.cam.ac.uk/personal/pemsley/coot/source/releases/$pkgname-$pkgver.tar.gz
	coot-configure.in.patch
	coot-user-manual.texi.patch
	coot-makefile.patch
        coot-guile.patch
        coot-python.patch
        coot-icons.patch
        coot-lidia.patch)

sha256sums=('63c2697127c80c79721e41c6723c6b121edaafffe81a731748cb31fa2be409d3'
            'f9365205ca61d219bb7a954eff1a41d7ff48435d4822e2fd6daf841c42781271'
            '2f5da6f7683d6d2b8add8c2cf4e821aaa839a214585d5ab480f38486e3fe9857'
            'c6b36d90900d6b4586391fa9e9738c09237761bf1e96b981d5a0f7c387e22570'
            'c15e844536f512c2d5524391dbc046a889a0d5f8c23336b854508e453e226911'
            'f4747e1fc7a3387f42b6c40358f999404761a0282ee6be3c621091d9d5d88099'
            'e0d71a20d401435175398ab554f872598d2b4ee95332238f9f0e39ed16ee55f6'
            '8e86f22eb30488573dd97335f78b38d5138127f168920b286e07d8e29d171580')

build() {

  cd "$srcdir/$pkgname-$pkgver"

#  patch -Np0 -i "$srcdir/coot-configure.in.patch"
  patch -Np0 -i "$srcdir/coot-user-manual.texi.patch"
  patch -Np0 -i "$srcdir/coot-guile.patch"
  patch -Np0 -i "$srcdir/coot-python.patch"
  patch -Np0 -i "$srcdir/coot-icons.patch"
  patch -Np0 -i "$srcdir/coot-lidia.patch"

  iconv -f iso8859-1 -t utf-8 README > README.conv && mv -f README.conv README
  
  aclocal -I macros
  libtoolize --automake --copy
  autoconf
  automake --copy --add-missing --gnu
  
  CXXFLAGS="${CXXFLAGS} -fpermissive"
  CFLAGS="${CFLAGS} -fpermissive"

  ./configure --prefix=/usr \
              --includedir=/usr/include/coot \
              --with-guile \
              --with-python \
              --with-pygtk \
              --disable-static
  
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
} 
