# Maintainer: Mike Dacre <mike@dacre.me>
pkgname=qguiconnect
pkgver=0.2
pkgrel=1
pkgdesc="Allows the running of reconnectable GUI programs via torque with xpra"
arch=('any')
license=('MIT')
depends=('torque' 'xpra-winswitch')
optdepends=('rstudio-desktop')
url="https://github.com/MikeDacre/qguiconnect"
install=instructions.install
source=('qguiconnect_sources.tar.gz')
md5sums=('623f9d8243a7c4220920f7f7e8fac9b9')

package() {
  install -dm0755 "$pkgdir/usr/bin"
  install -dm0755 "$pkgdir/usr/share/qguiconnect"
  install -dm0755 "$pkgdir/usr/share/man/man1"
  install -dm0755 "$pkgdir/usr/share/licenses/qguiconnect"
  install -m0555 "$srcdir/qguiconnect.sh" "$pkgdir/usr/bin"
  install -m0444 "$srcdir/rstudio.pbs" "$pkgdir/usr/share/qguiconnect"
  install -m0444 "$srcdir/README.md" "$pkgdir/usr/share/qguiconnect"
  install -m0444 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/qguiconnect"
  install -m0444 "$srcdir/qguiconnect.1.gz" "$pkgdir/usr/share/man/man1/"
  cd "$pkgdir/usr/bin"
  ln -s qguiconnect.sh qguiconnect
}
