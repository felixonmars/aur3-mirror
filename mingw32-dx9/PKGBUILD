# Maintainer: mickael9 <mickael9 at gmail dot com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: rabyte <rabyte__gmail>
# Contributor: Alexander Jakopin <setrodox@users.sourceforge.net>
# Contributor: Matěj Týč <bubla@users.sourceforge.net>

pkgname=mingw32-dx9
pkgver=9.0
pkgrel=2
pkgdesc="Minimal DirectX 9 SDK for MinGW (headers + libs)"
arch=('any')
url="http://msdn.microsoft.com/directx/"
license=('unknown')
depends=('mingw32-gcc')
provides=('mingw32-dx7-headers' 'mingw32-dx8-headers')
conflicts=('mingw32-dx7-headers' 'mingw32-dx8-headers')
source=(http://alleg.sourceforge.net/files/dx9mgw.zip)
md5sums=('a0477bdfc848940788719d665355b256')
options=(!buildflags !strip)

build() {
  cd "${srcdir}/dx9mgw"

  mkdir -p "${pkgdir}/usr/i486-mingw32/include"
  cp "include/"*.h "${pkgdir}/usr/i486-mingw32/include/"
  
  mkdir -p "${pkgdir}/usr/i486-mingw32/lib"
  cp "lib/"*.a "${pkgdir}/usr/i486-mingw32/lib/"

  exclude=( include/dvdevcod.h
            include/dvdmedia.h
            include/dxerr8.h
            include/d3d9caps.h
            include/xprtdefs.h
            include/vidcap.h
            include/bdatypes.h
            include/errors.h
            include/strmif.h
            include/audevcod.h
            include/ks.h
            include/evcode.h
            include/d3d9.h
            include/mpegtype.h
            include/vmr9.h
            include/il21dec.h
            include/control.h
            include/edevdefs.h
            include/d3d9types.h
            include/ksmedia.h
            include/dxerr9.h
            include/qedit.h
            include/aviriff.h
            include/vptype.h
            include/amaudio.h
            lib/libdinput8.a
            lib/libmsdmo.a
            lib/libdsetup.a
            lib/libdxerr9.a
            lib/libdsound.a
            lib/libquartz.a
            lib/libdmoguids.a
            lib/libddraw.a
            lib/libd3d9.a
            lib/libdinput.a
            lib/libstrmiids.a
            lib/libd3dxof.a
            lib/libdplayx.a
            lib/libksuser.a
            lib/libksproxy.a
            lib/libdxguid.a)

  cd "${pkgdir}/usr/i486-mingw32"

  for excl in "${exclude[@]}"; do
      rm "$excl"
  done
}
