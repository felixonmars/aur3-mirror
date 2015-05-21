# Contributor: Cyberpunk <apocalipsisfull-2011@outlook.com>
# Maintainer: Cyberpunk <apocalipsisfull-2011@outlook.com>

pkgname=webcamstudio
pkgver=0.61
pkgrel=2
pkgdesc="WebcamStudio helps you create a virtual webcam that can show your deskto, overlays, effects, and more."
arch=('any')
url="http://es.ws4gl.org/"
license=('GPL')
depends=('java-runtime' 'ffmpeg')
source=("http://sourceforge.net/projects/${pkgname}/files/Sources/Stable/WebcamStudio/${pkgname}_${pkgver}.tar.bz2"
	"webcamstudio.desktop"
	"copyright"
	"webcamstudio.png")
sha256sums=('e8522dd7ee36b0a42f3b0f92959d73862edd5eb4318eeb6ac27e41257b43fd96'
            'fbc40bab39c034e8d503b497cc876d280ca4ff7a16e53011bc8d18365910d636'
            'fab640781da6d5a2d204cc45416a68ff9b08b1e29d51fc1bf034c3aff39286f7'
            'eb98eca4528a25cabace0e4ee4f7c347821b11718504eab41ae0106156b216f9')

build() {
  msg2 "Building WebcamStudio..."
  cd "${srcdir}/${pkgname}"
  ant clean jar
}

package() {

  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/lib/${pkgname}"
  install -dm755 "$pkgdir/usr/share/applications"
  install -dm755 "$pkgdir/usr/share/doc"
  install -dm755 "$pkgdir/usr/share/pixmaps"
  install -dm755 "$pkgdir/usr/share/doc/${pkgname}/examples"
  
  msg2 "Installing webcamstudio..."
  cp "${srcdir}/${pkgname}/dist/WebcamStudio.jar" "$pkgdir/usr/lib/${pkgname}/WebcamStudio.jar"
  cp -R "${srcdir}/${pkgname}/libraries" "$pkgdir/usr/lib/${pkgname}/lib"
  cp "webcamstudio.desktop" "$pkgdir/usr/share/applications/webcamstudio.desktop"
  cp "webcamstudio.png" "$pkgdir/usr/share/pixmaps/webcamstudio.png"
  cp "${srcdir}/${pkgname}/docs/CustomSource.wss" "$pkgdir/usr/share/doc/${pkgname}/examples/CustomSource.wss"
  cp "${srcdir}/${pkgname}/AUTHORS" "$pkgdir/usr/share/doc/${pkgname}/AUTHORS"
  cp "${srcdir}/${pkgname}/README" "$pkgdir/usr/share/doc/${pkgname}/README"
  cp "${srcdir}/${pkgname}/TODO" "$pkgdir/usr/share/doc/${pkgname}/TODO"
  cp "${srcdir}/${pkgname}/debian/copyright" "$pkgdir/usr/share/doc/${pkgname}/copyright"

cat > $pkgdir/usr/bin/${pkgname} << "EOF"
#!/bin/bash
cd /usr/lib/webcamstudio/ && java -jar WebcamStudio.jar "$@"
EOF
chmod 755 "$pkgdir/usr/bin/${pkgname}"
}

# Any error or failure please report it
# thank you