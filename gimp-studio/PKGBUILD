# Maintainer: foxbunny <bg.branko@gmail.com>
# Contributed fixes from: giniu <gginiu@gmail.com>
# Based on PKGBUILD by: tobias <tobias@archlinux.org>

pkgname=gimp-studio
pkgver=1.5
pkgrel=1

_gimp_ver=2.6.8
_painter_ver=20090715

pkgdesc="Gimp ${_gimp_ver} with added assets, scripts, and patches for digital painting."
arch=('i686' 'x86_64')
url="http://codaset.com/foxbunny/gimp-studio"
license=('GPL')
depends=('gtk2>=2.14.4' 'lcms>=1.17' 'libxpm>=3.5.7' 'libwmf>=0.2.8.4'
         'libxmu>=1.0.4' 'librsvg>=2.22.3' 'libmng>=1.0.10' 'dbus-glib>=0.76'
         'libexif>=0.6.16' 'pygtk>=2.13.0' 'desktop-file-utils' 'gegl>=0.1.0'
         'curl')
makedepends=('gutenprint>=5.0.2' 'intltool>=0.35.5' 'libwebkit'
             'gnome-python>=2.16.2' 'poppler-glib>=0.10.0' 'pkgconfig>=0.21'
             'alsa-lib>=1.0.16' 'libgnomeui>=2.22.1', 'p7zip' 'unzip')
optdepends=('gutenprint: for sophisticated printing only as gimp has built-in cups print support'
            'libwebkit: for the help browser'
            'poppler-glib: for pdf support'
            'hal: for Linux input event controller module'
            'alsa-lib: for MIDI event controller module'
            'adobe-icc: for soft-proofing'
            'eci-icc: for soft-proofing'
            'srgb-icc: for standardizing RGB workflow'
            'gimp-plugin-separate+: for CMYK output')
options=('!libtool' '!makeflags')
provides=("gimp=${_gimp_ver}")
replaces=('gimp-painter')
conflicts=('gimp-devel' 'gimp' 'gimp-git')
install=gimp-studio.install
source=(ftp://ftp.gimp.org/pub/gimp/v2.6/gimp-${_gimp_ver}.tar.bz2
        gimp-painter--${_painter_ver}.diff
        gimp-painter--giniu-fix-20090715.diff
        gimp-painter--giniu-fix-20100205.diff
        libpng-1.4.patch
        gtk-2.19.1.patch
        gimp-painter--giniu-about-fix-20100208.patch
        gimp-painter--giniu-preset-fix-20100208.patch
        gimp-splash-giniu-fix-20100209.diff
        http://gimp-studio.googlecode.com/files/gimp-splash.png
        http://gimp-studio.googlecode.com/files/gimp-painter-icons.tar.gz
        http://gimp-studio.googlecode.com/files/gimp_studio_addons_20100404.tar.bz2)
build() {
   cd "${srcdir}"
   # Fix for crashes on 64-bit architecture
   patch < ../gimp-painter--giniu-fix-20090715.diff || return 1
   cd "${srcdir}"/gimp-${_gimp_ver}
   # libpng-1.4 fix
   patch -p1 < ../libpng-1.4.patch || return 1
   # gtk-2.19.1 fix
   patch -p0 < ../gtk-2.19.1.patch || return 1
   # Gimp painter patch
   patch -p1 < ../gimp-painter--${_painter_ver}.diff || return 1
   # Gimp painter icons patch
   patch -p0 < ../gimp-painter--giniu-fix-20100205.diff || return 1
   for file in "${srcdir}"/gimp-painter-icons/*
   do
      install -Dm644 "${file}" \
         "${srcdir}"/gimp-${_gimp_ver}/themes/Default/images/tools || return 1
   done
   # Gimp painter presets patch
   patch -p0 < ../gimp-painter--giniu-preset-fix-20100208.patch || return 1
   # Gimp studio about dialog
   sed -e "s/PKGVER/${pkgver}/" ../gimp-painter--giniu-about-fix-20100208.patch > \
      gimp-painter-about-ver.patch
   patch -p0 < gimp-painter-about-ver.patch || return 1
   # Splash window fix
   sed -e "s/PKGVER/${pkgver}/;s/GIMPVER/${_gimp_ver}/;s/VERT_CORRECTION/44/" \
     ../gimp-splash-giniu-fix-20100209.diff > gimp-splash-giniu-fix-20100209.diff
   patch -p0 < gimp-splash-giniu-fix-20100209.diff || return 1

   # Configure and compile
   CFLAGS="${CFLAGS} -fno-strict-aliasing"
   CXXFLAGS="{$CXXFLAGS} -fno-strict-aliasing"
   ./configure --prefix=/usr --sysconfdir=/etc \
     --enable-mp --enable-gimp-console --enable-gimp-remote \
     --enable-python --without-gvfs --without-gnomevfs \
     --with-gif-compression=lzw --without-aa || return 1
   make || return 1
   make DESTDIR="${pkgdir}" install-strip || return 1

   ln -sf gimp-console-${pkgver%.*}.1.gz "${pkgdir}/usr/share/man/man1/gimp-console.1" || return 1
   ln -s gimptool-2.0 "${pkgdir}/usr/bin/gimptool" || return 1
   ln -sf gimptool-2.0.1.gz "${pkgdir}/usr/share/man/man1/gimptool.1" || return 1

   install -m644 "${srcdir}"/gimp-splash.png \
     "${pkgdir}"/usr/share/gimp/2.0/images/gimp-splash.png

   msg "Copying scripts, assets, and tool presets"
   cd "${srcdir}"
   
   for directory in brushes gradients palettes scripts tool-options
   do
     for file in ${directory}/*
     do
       install -Dm 644 "${file}" "${pkgdir}"/usr/share/gimp/2.0/"${file}" || return 1   
     done
   done
   
   msg "Copying plugins"
   for file in plug-ins/*
   do
     install -Dm 644 "${file}" "${pkgdir}"/usr/lib/gimp/2.0/"${file}" || return 1
   done

   msg "Copyng startup and tool settings"
   for file in sessionrc
   do
      install -Dm 644 rc/"${file}" \
        "${pkgdir}"/etc/gimp/2.0/"${file}" || return 1   
   done

   msg "Finished copying addons."

}
# md5 sums:

md5sums=('a4d9462c9420954824a80c9b1963f9d9'
         'a8d289fc2e83e2bd7b4b30fc791e72c7'
         'c6f8a00112b60d1932b304d4e062020c'
         'c5173bb04b43bbd8563e47fb06295311'
         '211eccab51593526e852816e647f7da4'
         '1c1593f20d04f9578d0b14fbdcec1bbe'
         '5ddbad9c3cc88371aeb53e9d80fea58c'
         '5226a7097f05872ee6c375baca1f7d60'
         '1a8e7027458b5fd2eeddbd3d83f3a057'
         '73f5a3a58ab242601fcd9f1d7aaf7f9a'
         'c06f8feed2827dbbdd1a0dfc6a7d17e4'
         'cdad5f95413091cc24f49c5b156fc1c4')
