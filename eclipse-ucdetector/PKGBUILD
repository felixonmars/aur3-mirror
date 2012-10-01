pkgname=eclipse-ucdetector
pkgver=1.10.0
pkgrel=1
pkgdesc='UCDetector (Unnecessary Code Detector - pronounced "You See Detector") is a eclipse PlugIn tool to find unnecessary (dead) public java code'
arch=('i686' 'x86_64')
url='http://www.ucdetector.org/'
license=('EPL')
depends=('eclipse')
optdepends=()
source=(http://sourceforge.net/projects/ucdetector/files/ucdetector/${pkgver}/org.ucdetector_${pkgver}.jar)
md5sums=(dfe600fd12c6a70c42c71897531f31c6)

build() {
  _dest=${pkgdir}/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse
  mkdir -p "$_dest/plugins"
  install -Dm644 "$srcdir/org.ucdetector_$pkgver.jar" "$_dest/plugins/"
}
