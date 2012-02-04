# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=xulrunner-1.8
_originalname=xulrunner
pkgver=1.8.1.14
pkgrel=3
pkgdesc="Mozilla Runtime Environment"
arch=(i686 x86_64)
license=('MPL' 'GPL' 'LGPL')
depends=('gcc-libs>=4.3.0' 'gtk2>=2.12.10' 'libidl2>=0.8.10' 'libxt' 'mozilla-common' 'nss>=3.11.9')
makedepends=('diffutils' 'libgnome>=2.22.0' 'patch' 'pkgconfig' 'zip')
options=(!makeflags)
provides=(gecko-sdk)
replaces=(gecko-sdk)
url="http://wiki.mozilla.org/XUL:Xul_Runner"
source=(ftp://ftp.uni-kl.de/pub/linux/archlinux/other/${_originalname}/${_originalname}-${pkgver}.tar.bz2
    	about-plugins.patch
        mozconfig
        moz310924.patch
        firefox-2.0-buildversion.patch
	    gnome_helpers_with_params.patch)
md5sums=('29139dcd6037e7c935edb29fb552d4d2'
         'b2b5ce5ddf6e84858b8acb1e71b4682f'
         '15aba400fb61dfdf22d6ebf7240a1b18'
         'd738fa1c18e27774fe632ca128f9ecef'
         '0f442c766df93aa2df21e1348c21408f'
         'fd50e0a1c20f5418eb10effb9eaacac2')
sha256sums=('02a0d4a66dce6aa9f7d723cb1b5052ab1b0748a14452bdcd2a513461e7349d07'
            'dde89f338b3b9ad75fc54365910392195ea85bf61bf589b1ba993e714d7fbc42'
            '3f819bc435ee3f70a6a56e611a89302e596453c66f499ef972448655803d6563'
            '3fe8c4627bde8904ef92cae186e4dffe0587b35a96236a3640c524f040ebd488'
            'f520c5aa22ec99d5dd978ea766b45cf06c98de7c0688bc40fd18d8c5c021217e'
            '715039551b0a97d6d93ec43f7f81f9c19358a0a1c8af92e757c1cdf343dbd1f7')

build() {
  cd ${startdir}/src/${_originalname}-${pkgver}
  patch -Np0 -i ${startdir}/src/moz310924.patch || return 1
  patch -Np1 -i ${startdir}/src/gnome_helpers_with_params.patch || return 1
  patch -Np0 -i ${startdir}/src/firefox-2.0-buildversion.patch || return 1
  patch -Np1 -i ${startdir}/src/about-plugins.patch || return 1
  cp ${startdir}/src/mozconfig .mozconfig
  if [ "${CARCH}" = "x86_64" ]; then
    echo "ac_cv_visibility_pragma=no" >> .mozconfig
  fi
  
  unset CFLAGS
  unset CXXFLAGS
  make -f client.mk build || return 1
  make DESTDIR=${startdir}/pkg DISTDIR=${startdir}/pkg install || return 1
  cd ${startdir}/pkg/usr/lib && ln -sf xulrunner-${pkgver} xulrunner
  cd ${startdir}/pkg/usr/include && ln -sf xulrunner-${pkgver} xulrunner
  cd ${startdir}/pkg/usr/share/idl && ln -sf xulrunner-${pkgver} xulrunner
  rm -rf ${startdir}/pkg/usr/bin/defaults
  #NSPR and NSS aren't built anyways, remove pkgconfig files for it
  rm -f ${startdir}/pkg/usr/lib/pkgconfig/xulrunner-ns{s,pr}.pc
  #Remove versioned directories from .pc files, fixes problems with updates
  sed -i -e "s/${_originalname}-${pkgver}/${_originalname}/" \
  	${startdir}/pkg/usr/lib/pkgconfig/*.pc
  mv ${startdir}/pkg/usr/bin/xulrunner ${startdir}/pkg/usr/bin/xulrunner-1.8
  mv ${startdir}/pkg/usr/lib/xulrunner-1.8.1.14/xulrunner-bin ${startdir}/pkg/usr/lib/xulrunner-1.8.1.14/xulrunner-1.8-bin
}
