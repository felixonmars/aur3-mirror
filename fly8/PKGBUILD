# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=fly8
pkgver=1.12
_pkgver=112
pkgrel=1
pkgdesc="A portable multiplayer flight simulator"
arch=('i686' 'x86_64')
url="http://www.samba.org/ftp/eyal/fly8/"
license=('GPL')
depends=('bash' 'libxpm')
source=("ftp://ftp.samba.org/pub/eyal/fly8/beta/${pkgname}${_pkgver}1.tgz"
        "00-install-paths.patch"
        "01-remove-svgalib-and-joystick.patch"
        "02-awk.patch"
        "03-config.patch"
        "${pkgname}.desktop"
        "${pkgname}.sh")
md5sums=('f12a8fa27ff77da8c3c24836be5d1872'
         'e050990a8e4d34f385fa4560b04523ca'
         'e4f88908a862eb7352588b80df501e68'
         '1c59d9d48172b4ac2912985e69932c37'
         'c31ffee1a1985c1e4a39df4388bb03db'
         'ac1464b59f1f9113b07de2f597c180ab'
         'b0569ce3e7b893124c3affb8b5a653de')

build() {
  cd "${srcdir}/${pkgname}"

  # Apply patches
  patch -Np1 -i ../00-install-paths.patch
  patch -Np1 -i ../01-remove-svgalib-and-joystick.patch
  patch -Np1 -i ../02-awk.patch
  patch -Np1 -i ../03-config.patch

  # Compile
  sh UNIX/config lx
  make all

  # Create documentation
  cd docs
  ./dodoc
}

package() {
  cd "${srcdir}/${pkgname}"

  make DESTDIR="${pkgdir}" install

  # Install a launcher
  install -Dm755 ../${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"

  # Install a desktop entry
  install -Dm644 UNIX/${pkgname}.xpm "${pkgdir}/usr/share/pixmaps/${pkgname}.xpm"
  install -Dm644 ../${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
