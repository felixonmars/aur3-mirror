pkgname=lib32-sdl-fullscreen-toggle
pkgver=1.2.15
pkgrel=3
pkgdesc='Simple DirectMedia Layer'
arch=(x86_64)
url=http://home.roadrunner.com/~nwmovies/
license=(LGPL2.1)
depends=(lib32-glibc sh)
makedepends=(gcc-multilib)
provides=(lib32-sdl)
conflicts=(lib32-sdl)
options=(staticlibs)
source=(
${url}fullscreen-toggle-1211.patch
http://libsdl.org/release/SDL-$pkgver.tar.gz
http://pkgs.fedoraproject.org/cgit/SDL.git/plain/SDL-$pkgver-add_sdl_config_man.patch
http://pkgs.fedoraproject.org/cgit/SDL.git/plain/SDL-$pkgver-ignore_insane_joystick_axis.patch
http://pkgs.fedoraproject.org/cgit/SDL.git/plain/SDL-$pkgver-no-default-backing-store.patch
http://pkgs.fedoraproject.org/cgit/SDL.git/plain/SDL-$pkgver-SDL_EnableUNICODE_drops_keyboard_events.patch
http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/media-libs/libsdl/files/libsdl-$pkgver-caca.patch
http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/media-libs/libsdl/files/libsdl-$pkgver-const-xdata32.patch
http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/media-libs/libsdl/files/libsdl-$pkgver-gamma.patch
http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/media-libs/libsdl/files/libsdl-$pkgver-resizing.patch
http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/media-libs/libsdl/files/libsdl-$pkgver-sdl-config.patch
)
sha256sums=(9fb14803530a966507da61ce9f6a462d03ad14e05d5793a4657e68f6543aa405
            d6d316a793e5e348155f0dd93b979798933fb98aa1edebcc108829d6474aad00
            bc789a23e4ac12e8b85b58bd22f8658d7aa9309637a6048b64ae2a513f0432c6
            7586d6124d5452ad721ca6aa10eae09946d94854748e22f9c9c6fdca3d0aeb12
            3941c44a5580df95c6868936cfc57ba3e7b6952fb8a3eb14f963d54d9d8ca8a4
            292046466d52a2ebe995a0121404864e4ee0de2b6024203acb95bbd600844da0
            4673baf63eeaf44eabc5e8c11305dfc074253ed584cfe1c5442e2ae2ff581bac
            b0560f37c8927d00cfb034580f15d08ebfd31bca38f470761957c02590b87f9e
            bdf3983a5854a9f46a9ada06dccc62b743418a7a770fd6614797c37d438a625c
            0e4c2c4a11dbf611e317be4e866f99bde619eb1ca3942524e96b7ef94d8180f4
            1c73cc815ae4f6fdaee3dc899a9f38e9f29f88e3997070c9fba226b36dbed015)

_confopts=(
  --disable-rpath
  --disable-static
  --libdir=/usr/lib32
  --prefix=/usr
  --with-x
)

prepare() {
  cd SDL-$pkgver

  patch -Np1 < ../fullscreen-toggle-1211.patch

  patch -Np0 < ../libsdl-$pkgver-sdl-config.patch
  patch -Np1 < ../libsdl-$pkgver-resizing.patch
  patch -Np1 < ../SDL-$pkgver-ignore_insane_joystick_axis.patch
  patch -Np1 < ../libsdl-$pkgver-gamma.patch
  patch -Np1 < ../libsdl-$pkgver-const-xdata32.patch
  patch -Np1 < ../libsdl-$pkgver-caca.patch
  patch -Np1 < ../SDL-$pkgver-add_sdl_config_man.patch
  patch -Np1 < ../SDL-$pkgver-no-default-backing-store.patch
  patch -Np1 < ../SDL-$pkgver-SDL_EnableUNICODE_drops_keyboard_events.patch

  aclocal -I acinclude
  autoconf
}

build() {
  cd SDL-$pkgver

  CC='gcc -m32' ./configure ${_confopts[@]}

  make
}

package() {
  cd SDL-$pkgver

  make DESTDIR=$pkgdir install

  rm -r $pkgdir/usr/{include,share}

  mv $pkgdir/usr/bin/sdl-config{,-32}
}
