# Contributor: daemonTutorials <http://www.daemon-tuts.de>
pkgname=tibia-mmorpg
pkgver=9.52
pkgrel=1
pkgdesc="A free 2D online role playing game. Works on both architectures. "
arch=('i686' 'x86_64')
url="http://www.tibia.com/"
license=('custom:"CipSoft"')
[ "$CARCH" = "i686" ] && depends=('libxdamage' 'mesa')
#[ "$CARCH" = "x86_64" ] && depends=('lib32-libxdamage' 'lib32-mesa')
makedepends=('')
source=(http://download.tibia.com/tibia${pkgver/./}.tgz \
	tibia.desktop \
	tibia.png \
	tibia.sh)
md5sums=('d29a14b87a0707db732b0df14e864f1f' '5f5c3a2aca2df581608c8916e4020f77' \
	 '8aece042ac8ef9eca96c9fe95136817b' '31890b0547961924b58db0afc33e6411')

build() {
  cd ${srcdir}/Tibia

}

package() {
  cd ${srcdir}/Tibia
  install -d ${pkgdir}/usr/share/{applications,pixmaps,tibia} \
	     ${pkgdir}/usr/bin || return 1

  rm -rf ${srcdir}/Tibia/{libc6,*.sh}
  
  if [ "$CARCH" = "x86_64" ]; then
    install -d ${pkgdir}/usr/share/${pkgname}/libc6 || return 1
    ln -s /usr/lib32/ld-* ${pkgdir}/usr/share/${pkgname}/libc6/ || return 1
    ln -s /usr/lib32/libanl* ${pkgdir}/usr/share/${pkgname}/libc6/ || return 1
    ln -s /usr/lib32/libBrokenLocale* ${pkgdir}/usr/share/${pkgname}/libc6/ || return 1
    ln -s /usr/lib32/{libc-*,libc.*} ${pkgdir}/usr/share/${pkgname}/libc6/ || return 1
    ln -s /usr/lib32/libcidn* ${pkgdir}/usr/share/${pkgname}/libc6/ || return 1
    ln -s /usr/lib32/libcrypt* ${pkgdir}/usr/share/${pkgname}/libc6/ || return 1
    ln -s /usr/lib32/{libdl-*,libdl.*} ${pkgdir}/usr/share/${pkgname}/libc6/ || return 1
    ln -s /usr/lib32/{libm-*,libm.*} ${pkgdir}/usr/share/${pkgname}/libc6/ || return 1
    ln -s /usr/lib32/libmemusage* ${pkgdir}/usr/share/${pkgname}/libc6/ || return 1
    ln -s /usr/lib32/{libnsl-*,libnsl.*} ${pkgdir}/usr/share/${pkgname}/libc6/ || return 1
    ln -s /usr/lib32/libnss_* ${pkgdir}/usr/share/${pkgname}/libc6/ || return 1
    ln -s /usr/lib32/libpcprofile* ${pkgdir}/usr/share/${pkgname}/libc6/ || return 1
    ln -s /usr/lib32/libpthread* ${pkgdir}/usr/share/${pkgname}/libc6/ || return 1
    ln -s /usr/lib32/libresolv* ${pkgdir}/usr/share/${pkgname}/libc6/ || return 1
    ln -s /usr/lib32/{librt-*,librt.*} ${pkgdir}/usr/share/${pkgname}/libc6/ || return 1
    ln -s /usr/lib32/libSegFault ${pkgdir}/usr/share/${pkgname}/libc6/ || return 1
    ln -s /usr/lib32/libthread_db* ${pkgdir}/usr/share/${pkgname}/libc6/ || return 1
    ln -s /usr/lib32/{libutil-*,libutil.*} ${pkgdir}/usr/share/${pkgname}/libc6/ || return 1

    ln -s /usr/lib32/libXdamage* ${pkgdir}/usr/share/${pkgname}/libc6/ || return 1
  fi

  install -m755 ${startdir}/tibia.sh ${pkgdir}/usr/bin/tibia || return 1
  install -m755 Tibia ${pkgdir}/usr/share/tibia/ || return 1
  install -m644 {*.dat,*.pic,*.spr,Patch,Showerror} ${pkgdir}/usr/share/tibia/ || return 1

  install -m644 ${startdir}/tibia.desktop ${pkgdir}/usr/share/applications/ || return 1
  install -m644 ${startdir}/tibia.png ${pkgdir}/usr/share/pixmaps/ || return 1
  install -m644 Tibia.xpm ${pkgdir}/usr/share/pixmaps/tibia.xpm || return 1
}
