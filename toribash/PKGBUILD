# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=toribash
pkgver=3.50
pkgrel=2
pkgdesc="A ragdoll-physics, turn-based fighting game from Sweden."
arch=('i686' 'x86_64')
url="http://www.toribash.com"
license=('custom')
depends=('freeglut' 'lua' 'sdl_mixer' 'sdl_ttf')

if [ "$CARCH" = "x86_64" ]; then
   source=(http://linux.toribash.com/download/amd64/${pkgname}-${pkgver}-amd64.tar.gz \
           ${pkgname}.sh ${pkgname}.desktop)
   md5sums=('eb94fce80c5b5344c209602d52091fb4'
            '80db069e676974fa2b5787b7c2933b72'
            '10f88b45a21788a95766bb92bdeaa9c5')
 else
   source=(http://linux.toribash.com/download/i386/${pkgname}-${pkgver}-i386.tar.gz \
           ${pkgname}.sh ${pkgname}.desktop)
   md5sums=('d2bce1f65caf4f012df2da5a8c191591'
            '80db069e676974fa2b5787b7c2933b72'
            '10f88b45a21788a95766bb92bdeaa9c5')
fi

package() {
# ---------------------- i686 architecture ----------------------
if [ "$CARCH" = "i686" ]; then
  cd "${srcdir}/${pkgname}-${pkgver}-i386"
  install -d "${pkgdir}/opt/toribash"
  cp -R * "${pkgdir}/opt/toribash"

# ---------------------- x86_64 architecture --------------------
elif [ "$CARCH" = "x86_64" ]; then
  cd "${srcdir}/${pkgname}-${pkgver}-amd64"
  install -d "${pkgdir}/opt/toribash"
  cp -a * "${pkgdir}/opt/toribash"
fi

# ---------------------- both architectures ---------------------
  install -D -m755 "${srcdir}/$pkgname.sh" "${pkgdir}/usr/bin/$pkgname"
  install -d "${pkgdir}/usr/bin" "${pkgdir}/usr/lib" "${pkgdir}/usr/share/licenses/$pkgname"
  ln -s "liblua.so.5.1" "${pkgdir}/usr/lib/liblua5.1.so.0"
  ln -s "/opt/$pkgname/license.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 "${srcdir}/$pkgname.desktop" "${pkgdir}/usr/share/applications/$pkgname.desktop"
}
