# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: Bernardo Barros <bernardobarros@gmail.com>
# Maintainer:  Patrick McCarty <pnorcks at gmail dot com>

pkgname=csound6-git
_realname=csound6
pkgver=6_0rc1.1.189.g049213b
pkgrel=1
pkgdesc="A programming language for sound rendering and signal processing - Git snapshot of v6 repo"
arch=('i686' 'x86_64')
url="http://www.csounds.com/"
license=('LGPL')
depends=('alsa-lib'
         'fltk'
         'fluidsynth'
         'jack'
         'liblo'
         'libpng'
         'libvorbis'
         'luajit'
         'portaudio'
         'portmidi'
         'python2'
         'stk'
         'wiiuse')
makedepends=('boost'
             'cmake'
             'eigen3'
             'git'
             'gmm'
             'ladspa'
             'pd'
             'swig')
provides=('csound6')
conflicts=('csound')
source=(git://git.code.sf.net/p/csound/csound6-git
        $_realname.sh
        luajit-pkgconfig.patch)
sha256sums=('SKIP'
            'dc8492555be0466d0aff3848797b413f870623c19058374f1f6a77d9805a99d5'
            '703b16dc9bb599d72b468e04558a3285000703066b3713e218ce4f4a61b1419d')

pkgver() {
  cd $pkgname/
  git describe --tags | sed -e 's|csound\(.*\)|\1|' -e 's|-|.|g'
}

prepare() {
  cd $pkgname/

  # XXX: due to churn in the makefiles, leave this out for now
  #patch -p1 -i "$srcdir/luajit-pkgconfig.patch"
}

build() {
  cd $pkgname/

  mkdir build
  cd build

  # Notes on the options:
  # - The CsoundAC bindings are currently broken due to build failures
  # - The Java interface is disabled because I'm not using it.
  #   Let me know if you want it enabled by default.
  # - CMake python 2 vs 3 detection is broken, thus the hardcoded path hints
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DUSE_COREMIDI=no \
        -DUSE_AUDIOUNIT=no \
        -DBUILD_JAVA_INTERFACE=no \
        -DBUILD_CSOUND_AC=no \
        -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
        -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
        ..
  make
}

package() {
  cd $pkgname/build/

  make DESTDIR="$pkgdir/" install

  # lua bindings
  install -Dm755 luaCsnd6.so "$pkgdir/usr/lib/lua/5.1/luaCsnd6.so"
  ln -sf /usr/lib/lua/5.1/luaCsnd6.so "$pkgdir/usr/lib/luaCsnd6.so"

  # python bindings
  install -d "$pkgdir/usr/lib/python2.7/site-packages"
  install -m755 _csnd6.so csnd6.py "$pkgdir/usr/lib/python2.7/site-packages/"
  ln -sf /usr/lib/python2.7/site-packages/_csnd6.so "$pkgdir/usr/lib/_csnd6.so"
  ln -sf /usr/lib/python2.7/site-packages/csnd6.py "$pkgdir/usr/lib/csnd6.py"

  # examples
  install -d "$pkgdir/usr/share/$_realname"
  cp -a ../examples "$pkgdir/usr/share/$_realname"
  cp -a ../samples "$pkgdir/usr/share/$_realname"

  # export vars in profile.d
  install -Dm755 "$srcdir/$_realname.sh" "$pkgdir/etc/profile.d/$_realname.sh"

  # python2 fix
  sed -i "s/^\#\!.*python/&2/" `grep -rl "\#\!.*python" "$pkgdir"`

  # install vim files
  install -d "$pkgdir/usr/share/vim/vimfiles/plugin"
  install -d "$pkgdir/usr/share/vim/vimfiles/syntax"
  install -m644 ../installer/misc/vim/csound.vim "$pkgdir/usr/share/vim/vimfiles/plugin/"
  install -m644 ../installer/misc/vim/csound_*.vim "$pkgdir/usr/share/vim/vimfiles/syntax/"

}

# vim:set ts=2 sw=2 et:
