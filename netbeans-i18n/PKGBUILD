# Maintainer: MrSerenity <MrSerenity@outlook.com>

pkgname=netbeans-i18n
_pkgname=netbeans
pkgver=8.0.1
_subver=201409082112
pkgrel=1
pkgdesc='IDE for Java, HTML5, PHP, Groovy, C and C++ for language of system'
arch=('any')
url='http://netbeans.org/'
license=('CDDL')
depends=('java-environment' 'ttf-font' 'libxtst' 'giflib' 'atk')
conflicts=('netbeans')
provides=('netbeans')
backup=('usr/share/netbeans/etc/netbeans.conf')
makedepends=('gendesk' 'setconf')
optdepends=('php: for developing programs in php'
            'groovy: for developing programs in groovy'
            'lib32-glibc')
install='netbeans.install'
options=('!strip')
source=("http://bits.netbeans.org/$pkgver/community/zip/$_pkgname-$pkgver-$_subver.zip"
        'netbeans.png')
sha256sums=('05a417106f4d62c43435ecabcd3018d67a81cba4dbf179da82123b927bc68209'
            '1d519f018ebeff6e29436c8492dbb266446bd0144fb5519b2ef6637664de6f4a')

prepare() {
  gendesk -f -n --pkgname "$_pkgname" --pkgdesc "$pkgdesc" \
    --custom "StartupWMClass=NetBeans IDE $pkgver" --name "NetBeans"
  setconf "$_pkgname/bin/$_pkgname" basedir "/usr/share/$_pkgname"
}

package() {
  mkdir -p "$pkgdir/usr/"{bin,share/applications}

  # Binary file
  install -Dm755 "$_pkgname/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

  # Resources
  cp -r "$_pkgname" "$pkgdir/usr/share/"

  # Desktop shortcut and icon
  install -Dm644 "$_pkgname.desktop" \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 "$_pkgname.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"

  # Cleanup of directory that contains the binary file and .exe-files
  rm -r "$pkgdir/usr/share/$_pkgname/bin"
}

# vim:set ts=2 sw=2 et:
