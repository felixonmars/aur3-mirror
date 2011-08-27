# Maintainer: cantabile <cantabile dot desu at gmail dot com>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: Darwin Bautista <djclue917@gmail.com>

_appname=soundkonverter
_suffix=-kde3
pkgname=${_appname}${_suffix}
pkgver=0.3.11
pkgrel=1
pkgdesc="Front-end to various audio converters - old kde3 version."
arch=('i686' 'x86_64')
url="http://www.kde-apps.org/content/show.php?content=29024"
license=('GPL')
depends=('cdparanoia' 'kdelibs3' 'taglib')
optdepends=('cdrkit: cdda2wav backend'
       'faac: faac backend'
       'faad2: faad backend'
       'ffmpeg: ffmpeg backend'
       'flac: flac backend'
       'lame: lame backend'
       'mplayer: mplayer backend'
       'vorbis-tools: oggenc, oggdec backends'
       'speex: speexenc, speexdec backends'
       'vorbisgain: vorbisgain backend')
conflicts=("${_appname}")
provides=("${_appname}=${pkgver}")
install=${pkgname}.install
source=("http://hessijames.googlepages.com/${_appname}-${pkgver}.tar.bz2"
        'gcc.patch'
        'fix-automake-version-test.patch')
md5sums=('96bde488573fa66421e346a6dc64b18f'
         '99d41e0d9c443278adfb3610997aca95'
         'bcd67ec735bdf11635a54a27ceef7eba')

build() {
  cd "${srcdir}/${_appname}-${pkgver}"
  source /etc/profile.d/qt3.sh
  source /etc/profile.d/kde3.sh
  patch -p1 < "$srcdir/gcc.patch"
  patch -p0 -i "$srcdir/fix-automake-version-test.patch"
  make -f admin/Makefile.common
  ./configure \
     --prefix=/opt/kde \
     --disable-debug \
     --without-arts
  make || ( aclocal && make )
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/opt/kde/share/doc"
  # just a .desktop file ...
  rm -rf "${pkgdir}/usr"
}
