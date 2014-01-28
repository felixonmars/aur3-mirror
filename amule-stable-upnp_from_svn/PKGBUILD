
pkgname=amule-stable-upnp_from_svn
pkgver=2.3.1
pkgrel=3
pkgdesc="An eMule-like client for ed2k p2p network. Stable version with the Debian patches to fix compiling on newer gcc/g++ versions. UPnP support taken from the SVN version, so UPnP may be broken (Although it works for me fine)!"
arch=('i686' 'x86_64')
url="http://www.amule.org"
license=('GPL')
depends=('wxgtk' 'wxgtk2.8' 'gd' 'geoip' 'libupnp' 'crypto++' 'libsm')
#Alright, I didn't know what are the make depends so I included the same ones as depends (That's lame, I know...)
makedepends=('wxgtk' 'wxgtk2.8' 'gd' 'geoip' 'libupnp' 'crypto++' 'libsm')
install=amule.install
source=("http://sourceforge.net/projects/amule/files/aMule/${pkgver}/aMule-${pkgver}.tar.bz2/download"
        'amuled.systemd'
        'amuleweb.systemd'
	'patches.tar.gz'
	'UPnPBase.cpp'
	'UPnPBase.h'
	'UPnPCompatibility.h'

)
md5sums=('31724290a440943f5b05d4dca413fe02'
         '59772c41860e238f1c822feb8ca8d47f'
         '05975c5d94bfc41fddb894d98b1115d5'
	 'c81877fe5b57f2e994a1451696ba57f3'
	 'bd89ee603c77d2de3837742782924c1b'
	 '2e4fd6572b8c918bb0a3daa31e63aab8'
	 '892993222e4cd393cc82ed3d64f48e14')
provides=('amule')
conflicts=('amule')
build() {
  cd "${srcdir}/aMule-${pkgver}"
  rm -f ./src/utils/patches/cryptopp/*
  cp ${srcdir}/*.cpp ./src/
  cp ${srcdir}/*.h ./src/
  rm ${srcdir}/libupnp-fix-publisherurl.patch
  ./configure --prefix=/usr \
              --mandir=/usr/share/man \
              --enable-cas \
              --enable-wxcas \
              --enable-amule-daemon \
              --enable-amulecmd \
              --enable-amule-gui \
              --enable-alc \
              --enable-alcc \
              --enable-webserver \
              --disable-debug \
              --enable-optimize \
              --enable-ccache \
              --enable-geoip \
              --enable-upnp \
	      --with-wxversion=2.8
  find ../ -name "*.patch" -exec patch -p1 -i {} \;
  find ../ -name "*.diff" -exec patch -p1 -i {} \;
  make
}

package() {
  cd "${srcdir}/aMule-${pkgver}"
  make DESTDIR=${pkgdir} install
  install -D -m644 "${srcdir}/amuled.systemd" "${pkgdir}/usr/lib/systemd/system/amuled.service"
  install -D -m644 "${srcdir}/amuleweb.systemd" "${pkgdir}/usr/lib/systemd/system/amuleweb.service"
}
