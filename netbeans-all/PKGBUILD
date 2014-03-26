# $Id: PKGBUILD 108041 2014-03-21 16:52:18Z arodseth $
# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Timm Preetz <timm@preetz.us>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=netbeans-all
_pkgname=netbeans
pkgver=8.0
_subpkgver=201403101706
pkgrel=1
pkgdesc='IDE for Java, HTML5, PHP, Groovy, C and C++ - includes all packs'
arch=('any')
url='http://netbeans.org/'
license=('CDDL')
# classpath is not needed, see FS#38567 (Oracle JDK does not need atk either)
depends=('java-environment' 'ttf-font' 'libxtst' 'giflib' 'atk')
backup=('usr/share/netbeans/etc/netbeans.conf')
makedepends=('gendesk' 'setconf')
optdepends=('php: for developing programs in php'
            'groovy: for developing programs in groovy'
            'lib32-glibc')
install='netbeans.install'
options=('!strip')
provides=('netbeans')
conflicts=('netbeans')
source=("http://dlc.sun.com.edgesuite.net/${_pkgname}/$pkgver/final/zip/${_pkgname}-$pkgver-$_subpkgver.zip")
# http://dlc.sun.com.edgesuite.net/netbeans/8.0/final/zip/
sha256sums=('0d063507f48292f4033a238783fb318a6df58485a7be86206a45a97ce12de97b')

prepare() {
  gendesk -f -n --pkgname "$_pkgname" --pkgdesc "$pkgdesc"
  setconf "$_pkgname/bin/$_pkgname" basedir "/usr/share/$_pkgname"
}

package() {
  mkdir -p "$pkgdir/usr/"{bin,share/applications}
  cp -r "$_pkgname" "$pkgdir/usr/share/"
  install -Dm644 "$_pkgname.desktop" \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"
  cd "$_pkgname"
  install -Dm644 "nb/$_pkgname.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  install -Dm755 "bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

  # Cleanup (contains the file that is now placed in /usr/bin + .exe-files)
  rm -r "$pkgdir/usr/share/$_pkgname/bin"
}

# vim:set ts=2 sw=2 et:
