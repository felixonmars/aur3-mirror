# Maintainer: Chaiwat Suttipongsakul <cwt114@gmail.com>

pkgname=xulrunner-thai
pkgver=1.8.1.1
pkgrel=1
pkgdesc="Mozilla Runtime Environment with Thai word break"
arch=(i686 x86_64)
depends=('gtk2>=2.10.0' 'pango>=1.14.0' 'gcc' 'libidl2' 'mozilla-common' 'nss' 'libxt')
makedepends=('zip' 'pkgconfig' 'python' 'autoconf-compat')
provides=(gecko-sdk xulrunner)
replaces=(gecko-sdk xulrunner)
url="http://wiki.mozilla.org/XUL:Xul_Runner"
source=(http://www.archlinux.org/~jgc/mozilla/xulrunner-${pkgver}-source.tar.bz2
        mozconfig
        firefox-1.1-uriloader.patch
	firefox-1.5-pango-cursor-position.patch
	firefox-2.0-buildversion.patch
        moz310924.patch
	moz325644.patch
	nsIPermission.patch
	mozilla-mozlibthai-wbr.patch)
md5sums=('d3f4e8a9aeb772588a810c81913d0d03' 'd4ed1a071d5d356c0092492b828a17d4'\
         '2bd0dd9035dcb875b8340be358347e8d' '288fb7db871700ff5cf7286db6192b45'\
         '11b221ff41078d97c131e17361072e47' '29194973e2a535b460c6b7f92c635eaf'\
         '2082c2a2d1cedd08e83179271aacf337' 'c24033e06bde73b3bd3d935ea87c22df'\
	 '8dcd0164723acb73c70ec0d6cdba2694')

build() {
  export MAKEFLAGS="-j1"
  cd ${startdir}/src/mozilla
  patch -Np0 -i ${startdir}/src/firefox-2.0-buildversion.patch || return 1
  patch -Np0 -i ${startdir}/src/firefox-1.1-uriloader.patch || return 1
  patch -Np0 -i ${startdir}/src/moz310924.patch || return 1
  patch -Np0 -i ${startdir}/src/moz325644.patch || return 1
  patch -Np1 -i ${startdir}/src/firefox-1.5-pango-cursor-position.patch || return 1
  patch -Np0 -i ${startdir}/src/nsIPermission.patch || return 1
  patch -Np1 -i ${startdir}/src/mozilla-mozlibthai-wbr.patch || return 1

  [ "${CARCH}" = "x86_64" ] && echo "ac_cv_visibility_pragma=no" >> ${startdir}/src/mozconfig

  sed "s/#CFLAGS#/${CFLAGS}/g" ${startdir}/src/mozconfig >.mozconfig

  autoconf-2.13

  make -f client.mk build || return 1
  make DESTDIR=${startdir}/pkg DISTDIR=${startdir}/pkg install || return 1

  cd ${startdir}/pkg/opt/mozilla/lib && ln -sf xulrunner-${pkgver} xulrunner
  cd ${startdir}/pkg/opt/mozilla/include && ln -sf xulrunner-${pkgver} xulrunner
  cd ${startdir}/pkg/opt/mozilla/share/idl && ln -sf xulrunner-${pkgver} xulrunner

  rm -rf ${startdir}/pkg/opt/mozilla/bin/defaults

  #NSPR and NSS aren't built anyways, remove pkgconfig files for it
  rm -f ${startdir}/pkg/opt/mozilla/lib/pkgconfig/xulrunner-ns{s,pr}.pc
  #Remove versioned directories from .pc files, fixes problems with updates
  sed -i -e "s/xulrunner-${pkgver}/xulrunner/" \
  	${startdir}/pkg/opt/mozilla/lib/pkgconfig/*.pc

  mkdir -p ${startdir}/pkg/usr/lib
  mv ${startdir}/pkg/opt/mozilla/lib/python2.4 ${startdir}/pkg/usr/lib/python2.4
}
