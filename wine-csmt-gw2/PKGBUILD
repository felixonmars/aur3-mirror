# Maintainer: mareex <marcus dot behrendt dot 86 at gmail dot com>
# Based on the wine-silverlight package in AUR

pkgname=wine-csmt-gw2
_pkgname=wine
pkgver=1.7.24
pkgrel=1
pkgdesc="Wine with D3D command stream patches (fixes mouse look in Guild Wars 2)"
url="http://www.winehq.com"
arch=('i686' 'x86_64')
license='LGPL'
install=${pkgname}.install

source=("${_pkgname}-${pkgver}.zip::https://github.com/stefand/wine/archive/cs-0.9.1.zip"
        "mouselook.patch"
        "30-win32-aliases.conf")
md5sums=('b7ce7b09489af0421703a0c9e4033b7d'
         '24ae7f4e465d9963585494a68418b3ee'
         '1ff4e467f59409272088d92173a0f801')

depends=('fontconfig'
         'libxcursor'
         'libxrandr'
         'libxdamage'
         'libxi'
         'gettext'
         'freetype2'
         'glu'
         'libsm'
         'gcc-libs'
         'attr'
         'desktop-file-utils')

makedepends=('libgl'
             'autoconf'
             'ncurses'
             'bison'
             'perl'
             'fontforge'
             'flex'
             'prelink'
             'gcc>=4.5.0-2'
             'giflib'
             'libpng'
             'gnutls'
             'libxinerama'
             'libxcomposite'
             'libxmu'
             'libxxf86vm'
             'libxml2'
             'libldap'
             'lcms'
             'mpg123'
             'openal'
             'v4l-utils'
             'alsa-lib'
             'mesa'
             'libcl'
             'opencl-headers'
             'pulseaudio'
             'samba')

optdepends=('giflib'
            'libpng'
            'libldap'
            'gnutls'
            'lcms'
            'libxml2'
            'mpg123'
            'openal'
            'v4l-utils'
            'libpulse'
            'alsa-plugins'
            'alsa-lib'
            'libjpeg-turbo'
            'libxcomposite'
            'libxinerama'
            'libncurses'
            'libcl'
            'pulseaudio'
            'oss'
            'cups'
            'samba')

if [[ $CARCH == x86_64 ]]; then

  depends=('lib32-fontconfig'
           'lib32-libxcursor'
           'lib32-libxrandr'
           'lib32-libxdamage'
           'lib32-libxi'
           'lib32-gettext'
           'lib32-glu'
           'lib32-libsm'
           'lib32-gcc-libs'
           'lib32-attr'
           'desktop-file-utils')

  makedepends=('autoconf'
               'ncurses'
               'bison'
               'perl'
               'fontforge'
               'flex'
               'prelink'
               'gcc-multilib>=4.5.0-2'
               'lib32-giflib'
               'lib32-libpng'
               'lib32-gnutls'
               'lib32-libxinerama'
               'lib32-libxcomposite'
               'lib32-libxmu'
               'lib32-libxxf86vm'
               'lib32-libxml2'
               'lib32-libldap'
               'lib32-lcms'
               'lib32-mpg123'
               'lib32-openal'
               'lib32-v4l-utils'
               'lib32-alsa-lib'
               'lib32-mesa'
               'lib32-libgl'
               'lib32-libcl'
               'attr'
               'samba'
               'pulseaudio'
               'opencl-headers')

  optdepends=('lib32-giflib'
              'lib32-libpng'
              'lib32-libldap'
              'lib32-gnutls'
              'lib32-lcms'
              'lib32-libxml2'
              'lib32-mpg123'
              'lib32-openal'
              'lib32-v4l-utils'
              'lib32-libpulse'
              'lib32-alsa-plugins'
              'lib32-alsa-lib'
              'lib32-libjpeg-turbo'
              'lib32-libxcomposite'
              'lib32-ncurses'
              'lib32-libcl'
              'lib32-libpulse'
              'oss'
              'cups'
              'samba')

fi

makedepends+=('git')

_upname="${_pkgname}-${pkgver}"

# Uncomment the line below if you want wine installed to /opt/wine-silverlight instead of replacing wine
customprefix=1

if [[ $customprefix != 1 ]]; then
  _prefix="usr"
  _sysconf="etc"
  conflicts=('wine')
  provides=("wine=${pkgver}")
else
  # change _prefix if you don't want to use the default custom prefix of /opt/wine-silverlight
  _prefix="opt/$pkgname"
  _sysconf="$_prefix/etc"
fi

prepare() {
  cd "$srcdir"

  # Get rid of old build dirs
  rm -rf $pkgname-{32,64}-build
  rm -rf $_upname
  mkdir $pkgname-32-build

  # These additional CPPFLAGS solve FS#27662 and FS#34195
  export CFLAGS="$CFLAGS -DHAVE_ATTR_XATTR_H=1"
  export CPPFLAGS="${CPPFLAGS/-D_FORTIFY_SOURCE=2/} -D_FORTIFY_SOURCE=0"

  mv ${_pkgname}-cs-0.9.1 ${_upname}

  cd "$srcdir"/"${_upname}"

  patch -Np1 < $srcdir/mouselook.patch

  ./tools/make_requests
  autoreconf

  # ncurses fix
  sed -i 's|libncurses|libncursesw|g' "$srcdir/$_upname/configure"
  sed -i 's|lncurses|lncursesw|g' "$srcdir/$_upname/configure"
}

LDSHARED=/usr/bin/

build() {
  cd ${srcdir}

  # ncurses fix
  sed -i 's|libncurses|libncursesw|g' ${srcdir}/${_pkgname}-${pkgver}/configure
  sed -i 's|lncurses|lncursesw|g' ${srcdir}/${_pkgname}-${pkgver}/configure

  if [[ $CARCH == x86_64 ]]; then

    msg2 "Building Wine-64..."
    mkdir $pkgname-64-build
    cd "$srcdir/$pkgname-64-build"
    ../$_upname/configure \
      --prefix=/$_prefix \
      --sysconfdir=/$_sysconf \
      --libdir=/$_prefix/lib \
      --with-x \
      --without-gstreamer \
      --enable-win64
    # Gstreamer was disabled for FS#33655

    make

    _wine32opts=(
      --libdir=/$_prefix/lib32
      --with-wine64="$srcdir/$pkgname-64-build"
    )

    export PKG_CONFIG_PATH="/$_prefix/lib32/pkgconfig"
  fi

  msg2 "Building Wine-32..."
  cd "$srcdir/$pkgname-32-build"
  ../$_upname/configure \
    --prefix=/$_prefix \
    --sysconfdir=/$_sysconf \
    --with-x \
    --without-gstreamer \
    "${_wine32opts[@]}"

  # These additional flags solve FS#23277
  make CFLAGS+="-mstackrealign -mincoming-stack-boundary=2" CXXFLAGS+="-mstackrealign -mincoming-stack-boundary=2"
}

package() {
  msg2 "Packaging Wine-32..."
  cd "$srcdir/$pkgname-32-build"

  if [[ $CARCH == i686 ]]; then
    make prefix="$pkgdir/$_prefix" install
  else
    make prefix="$pkgdir/$_prefix" \
      libdir="$pkgdir/$_prefix/lib32" \
      dlldir="$pkgdir/$_prefix/lib32/wine" install

    msg2 "Packaging Wine-64..."
    cd "$srcdir/$pkgname-64-build"
    make prefix="$pkgdir/$_prefix" \
      libdir="$pkgdir/$_prefix/lib" \
      dlldir="$pkgdir/$_prefix/lib/wine" install
  fi

  # Font aliasing settings for Win32 applications
if [[ $customprefix != 1 ]]; then
  install -d "$pkgdir"/etc/fonts/conf.{avail,d}
  install -m644 "$srcdir/30-win32-aliases.conf" "$pkgdir/etc/fonts/conf.avail"
  ln -s ../conf.avail/30-win32-aliases.conf "$pkgdir/etc/fonts/conf.d/30-win32-aliases.conf"
fi
}	
