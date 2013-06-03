# Maintainer: M0Rf30
pkgname=webcamstudio-svn
pkgver=483
pkgrel=1
pkgdesc="WebcamStudio helps you create a virtual webcam that can show your desktop, overlays, effects, and more."
arch=('any')
url="https://code.google.com/p/webcamstudio/"
license=('GPL')
depends=('java-runtime' 'ffmpeg' 'dvgrab')
optdepends=('vloopback-svn: Provides V4L loopback support'
	'v4l2loopback: Provides V4L2 loopback support')
makedepends=('subversion' 'apache-ant' 'junit')
conflicts=('webcamstudio')
replaces=('webcamstudio')
source=('svn+http://webcamstudio.googlecode.com/svn/trunk/')

pkgver() {
  cd "$SRCDEST/trunk"
  svnversion | tr -d [A-z]
}

build() {
  cd "$srcdir/trunk"
  ant clean jar
  cd vloopback
  make
  make libwebcamstudio
}


package() {
  cd "$srcdir/trunk"
  install -Dm755 dist/WebcamStudio.jar "$pkgdir"/usr/lib/webcamstudio/WebcamStudio.jar
  ##Copy libwebcamstudio and create lib links
	install -Dm755 vloopback/libwebcamstudio.so.1.0.1 "$pkgdir"/usr/lib/libwebcamstudio.so.1.0.1
	ln -s /usr/lib/libwebcamstudio.so.1.0.1 "$pkgdir"/usr/lib/libwebcamstudio.so.1 
	ln -s /usr/lib/libwebcamstudio.so.1 "$pkgdir"/usr/lib/libwebcamstudio.so
  mkdir "$pkgdir"/usr/lib/webcamstudio/lib
  mkdir -p "$pkgdir"/usr/{share/{applications,pixmaps},bin}
  cp debian/webcamstudio.desktop "$pkgdir"/usr/share/applications
  cp debian/webcamstudio.png "$pkgdir"/usr/share/pixmaps
  cp debian/wrappers/webcamstudio "$pkgdir"/usr/bin
  chmod +x "$pkgdir"/usr/bin/webcamstudio
  cp libraries/commons-io-*.jar "$pkgdir"/usr/lib/webcamstudio/lib
  cp libraries/jffmpeg-*.jar "$pkgdir"/usr/lib/webcamstudio/lib
  cp libraries/jtwitter*.jar "$pkgdir"/usr/lib/webcamstudio/lib
  cp libraries/mail.jar "$pkgdir"/usr/lib/webcamstudio/lib
  cp libraries/zxing*.jar "$pkgdir"/usr/lib/webcamstudio/lib
  cp src/webcamstudio/resources/start.gif "$pkgdir"/usr/lib/webcamstudio
}

md5sums=('SKIP')
