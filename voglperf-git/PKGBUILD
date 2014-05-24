pkgname=voglperf-git
_name=voglperf
pkgver=35.f4b779d
pkgrel=1
pkgdesc="Benchmarking tool for Linux OpenGL games. Spews frame information every second."
url="https://github.com/ValveSoftware/voglperf"
arch=('i686' 'x86_64')
license=('BSD') # i think
#depends=("libtinfo")  # no
makedepends=("cmake")
#[ "$CARCH" = "x86_64" ] && depends=("lib32-sdl2" "sdl2")
options=('!libtool')
source=('git+https://github.com/ValveSoftware/voglperf.git')

pkgver() {
  cd "$_name"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "$_name"
  # sed will be enough
  # set paths and fix name of library to load. no need for 32 and 64
  sed 's;get_ld_preload_str("./libvoglperf32.so", "./libvoglperf64.so;get_ld_preload_str("/usr/lib32/libvoglperf.so", "/usr/lib/libvoglperf.so;g' -i src/voglperfrun.cpp
  sed "s/tinfo/ncurses/g" -i src/CMakeLists.txt
}

build() {
  #  export CFLAGS="-Og -ggdb"
  #  export CXXFLAGS="-Og -ggdb"
  cd "$_name"
  #sed -i "s/libSDL2.a/SDL2/g" src/CMakeLists.txt # we don't have static sdl2 on arch

  #  ./autogen.sh
  #  ./configure --prefix=/usr \

   [ "$CARCH" = "i686" ] && make voglperf32 # always 32 bit
  [ "$CARCH" = "x86_64" ] &&  CMAKE_LIBRARY_PATH=/usr/lib32 make voglperf32 # will try to link to /usr/libGL.so
  [ "$CARCH" = "x86_64" ] &&  make voglperf64
}

#check() {
#  cd "$_name"
#  make -k check
#}

package() {
  cd "$_name"
  #  make DESTDIR="$pkgdir" install
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/lib"

  install -m 755 bin/voglperfrun* "$pkgdir/usr/bin"

  # on 64 bit, 64 bit libraries go into /usr/lib
  # and also create /usr/lib32 and put the 32 bit library there
  [ "$CARCH" = "x86_64" ] && install -d "$pkgdir/usr/lib32" || true
  [ "$CARCH" = "x86_64" ] && install -m 755 bin/libvoglperf32.so "$pkgdir/usr/lib32/libvoglperf.so" || true
  [ "$CARCH" = "x86_64" ] && install -m 755 bin/libvoglperf64.so "$pkgdir/usr/lib/libvoglperf.so" || true

  # on 32 bit, 32 bit libraries go into /usr/lib
  [ "$CARCH" = "i686" ] && install -m 755 bin/libvoglperf32.so "$pkgdir/usr/lib/libvoglperf.so" || true

  #install -d "$pkgdir/usr/share/voglperf"
  #install -m 755 bin/index.html "$pkgdir/usr/share/voglperf/index.html"
}

md5sums=('SKIP')
