# Mantainer: Federico 'baghera' Chiacchiaretta <federico.chia at gmail.com>

pkgname=amule-adunanza
pkgver=2010.1
_amulever=2.2.6
pkgrel=1
pkgdesc="An aMule version patched for use with Adunanza Network (Fastweb - Italy)"
url="http://amule-adunanza.sourceforge.net/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('wxgtk' 'gd' 'geoip' 'libupnp' 'crypto++')
conflicts=('amule' 'amule-adnza-svn' 'amule-adnza')
provides=('amule=${_amulever}')
source=(http://downloads.sourceforge.net/amule-adunanza/aMule-AdunanzA/Stable/aMule-AdunanzA-${pkgver}-${_amulever}.tar.bz2
	svn_fixes.patch
	wxfont.patch
	gcc-4.7.patch)
md5sums=('9156f5c8f7f70269e3c328c05146a3e7'
         '9833f5eacfa485e6bf9a4f624b1be231'
         '92556fd14c4b4180791e942140ec1d5a'
         'f2f923bfec2f8805251ea3561a5d539a')

build() {
  cd ${srcdir}/aMule-AdunanzA-${pkgver}-${_amulever}

  # Apply patch from revision 277 to 282
  patch -Np1 -i ${srcdir}/svn_fixes.patch || return 1
  # Apply patch for new wxgtk
  patch -Np0 -i ${srcdir}/wxfont.patch || return 1
  # Patch for compilation against gcc 4.7
  patch -Np0 -i ${srcdir}/gcc-4.7.patch
  
  ./configure --prefix=/usr \
	--enable-upnp \
	--enable-geoip \
	--enable-cas \
	--enable-wxcas \
	--enable-amule-daemon \
	--enable-amulecmd \
	--enable-webserver \
	--enable-amule-gui \
	--enable-alc \
	--enable-alcc \
	--disable-debug \
	--enable-optimize
  make || return 1
  make DESTDIR=${pkgdir} install
}
