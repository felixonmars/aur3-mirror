# Contributor: [wisp558] <wisp558@gmail.com>
pkgname=bsnes-phoenix
pkgver=0.081
pkgrel=1
pkgdesc="Super Nintendo Entertainment System (SNES) emulator focused on accuracy, with a minimalistic GTK based user interface."
arch=('i686' 'x86_64')
url="http://byuu.org/bsnes/"
license=('GPL2' 'LGPL') # The phoenix port doesn't support archived roms.
depends=('libgl' 'libxv' 'sdl' 'gtk2')
makedepends=('pkgconfig' 'mesa')
replaces=('supergameboy' 'bsnes')
source=("http://bsnes.googlecode.com/files/bsnes_v081-source.tar.bz2")
md5sums=('860d4ba0a00ddc0aaf59d31af54661f3')

build() {
  cd "${srcdir}/bsnes_v081-source/bsnes"

  # Build fixes for GCC 4.6.0
  #patch -p0 < "${srcdir}/gcc_4.6.0_build_fix.patch"

  # Makefile hacks
  # Disable extraneous audio drivers.
  sed -e 's|audio.pulseaudio ||' \
      -e 's|audio.pulseaudiosimple ||' \
      -e 's|audio.openal ||' \
      -e 's|audio.ao||' \
      -i "${srcdir}/bsnes_v081-source/bsnes/ui/Makefile" || return 1
  # Don't run gconftool
  sed -e 's|gconftool-2 --type bool|#gconftool-2 --type bool|' \
      -i "${srcdir}/bsnes_v081-source/bsnes/Makefile" || return 1
  # Force phoenix-gtk
  sed -e 's|# phoenix := gtk|phoenix := gtk|' \
      -i "${srcdir}/bsnes_v081-source/bsnes/Makefile" || return 1


  # Build the different profiles and install them
  for profile in compatibility performance accuracy; do
    msg "Building profile: ${profile}"
    make clean
    make compiler=gcc platform=x profile=${profile} || return 1
    make install profile=${profile} DESTDIR=${pkgdir} prefix=/usr || return 1
    mv ${pkgdir}/usr/bin/bsnes ${pkgdir}/usr/bin/bsnes-${profile}
  done

  # The phoenix port has no launcher, so I set a symbolic link of bsnes to point to the compatibility profile.
  msg "Linking default profile..."
  ln -s ${pkgdir}/usr/bin/bsnes-compatibility ${pkgdir}/usr/bin/bsnes

  ##
  # Now lets build and install the plugins, you can remove any of the below if
  # you don't want/need them.
  ##
  # snesfilter :: output filters
  ##
  # msg "Building plugin: snesfilter"
  # cd "${srcdir}/snesfilter"
  # sed -e 's|\(libsnesfilter.*\) $(DESTDIR)$(prefix)/lib|\1 $(DESTDIR)$(prefix)/lib/\1|' \
  #    -i "${srcdir}/snesfilter/Makefile" || return 1
  # make compiler=gcc || return 1
  # make install DESTDIR=${pkgdir} prefix=/usr || return 1
  # chmod 644 "${pkgdir}/usr/lib/libsnesfilter.a" || return 1
  ##
  # snesreader :: handle compressed files
  ##
  #msg "Building plugin: snesreader"
  #cd "${srcdir}/snesreader"
  #sed -e 's|\(libsnesreader.*\) $(DESTDIR)$(prefix)/lib|\1 $(DESTDIR)$(prefix)/lib/\1|' -i "${srcdir}/snesreader/Makefile" || return 1
  # make compiler=gcc || return 1
  # make install DESTDIR=${pkgdir} prefix=/usr || return 1
  # chmod 644 "${pkgdir}/usr/lib/libsnesreader.a" || return 1
  # Licenses
  # mkdir -p "${pkgdir}/usr/share/licenses/bsnes"
  # install -m644 "${srcdir}/snesreader/7z_C/lzma.txt" "${pkgdir}/usr/share/licenses/bsnes/license-7zip.txt"
  # install -m644 "${srcdir}/snesreader/unrar/license.txt" "${pkgdir}/usr/share/licenses/bsnes/license-unrar.txt"
  ##

  msg "Building snespurify"
  cd "${srcdir}/bsnes_v081-source/snespurify"
  sed -e 's|g++-4.5|g++|' -i ./cc-gtk.sh
  sh ./cc-gtk.sh
  install -m755 "${srcdir}/bsnes_v081-source/snespurify/snespurify-gtk" "${pkgdir}/usr/bin/snespurify-gtk"
}
