# Maintainer: SpepS <dreamspepser at yahoo dot it>

_name=Nsound
pkgname=nsound
pkgver=0.8.2
pkgrel=1
pkgdesc="A C++ framework with python bindings for audio synthesis that aims to be as powerful as Csound but with the programming features of C++."
arch=(i686 x86_64)
url="http://nsound.sourceforge.net/"
license=('GPL')
depends=('python2-matplotlib' 'libao' 'portaudio')
makedepends=('scons' 'swig')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz" wavelab.sh
        "http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-$pkgver/$pkgname-${pkgver}_users_guide.pdf")
md5sums=('e9f747d64ff294a1084c44a90ea76df9'
         'd957299f4875f5275e2e1f871cb35a58'
         'a0af840ed869c322b89dd0f7f4298d9b')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # remove -L/usr/lib flag
  sed -i '/\/usr\/lib/d;/lib_dir2,$/d' NsoundConfig_Linux.py

  # optimization flags
  export CXXFLAGS="-fno-strict-aliasing -fwrapv -O2"

  # use rpath-link flag
  sed -i 's/rpath/&-link/' NsoundConfig.py

  # Build
  scons setup.py --disable-openmp
  python2 setup.py build
  scons install
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # python bindings
  python2 setup.py install --root="$pkgdir/"

  # bins
  install -d "$pkgdir/usr/bin"
  install -Dm755 bin/* "$pkgdir/usr/bin"

  # libs
  install -d "$pkgdir/usr/lib"
  install -Dm755 lib/* "$pkgdir/usr/lib"

  # wavelab
  install -d "$pkgdir/usr/share/$_name/wavelab"
  install -Dm644 applications/wavelab/* \
    "$pkgdir/usr/share/$_name/wavelab"

  # wavelab launcher
  install -Dm755 ../wavelab.sh \
    "$pkgdir/usr/bin/wavelab"

  # headers
  install -d "$pkgdir/usr/include/$_name"
  install -Dm644 src/$_name/*.h \
    "$pkgdir/usr/include/$_name"

  # docs
  install -d "$pkgdir/usr/share/doc/$_name"
  install -Dm644 docs/*.odt \
    "$pkgdir/usr/share/doc/$_name"

  # pdf doc
  install -Dm644 ../$pkgname-${pkgver}_users_guide.pdf \
    "$pkgdir/usr/share/doc/$_name"

  # download and install examples
  cd src/examples && ./getWavefiles.bash
  install -d "$pkgdir/usr/share/$_name/examples"
  install -Dm644 *.{cc,py,wav} \
    "$pkgdir/usr/share/$_name/examples"
}

# vim:set ts=2 sw=2 et:
