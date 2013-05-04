# Contributor: Ondrej Kucera <ondrej.kucera@centrum.cz>

pkgname=jd-eclipse-realign
pkgver=0.1.3
pkgrel=1
pkgdesc="Java Decompiler plug-in for the Eclipse platform"
arch=('any')
url="http://mchr3k.github.io/jdeclipse-realign/"
license=('custom')
depends=("eclipse")
source=("http://mchr3k-eclipse.appspot.com/files/mchr3k-eclipse.zip")
md5sums=('3b47f89a27a339baf6d7f5d46d1244e9')

package() {
  cd $srcdir
  install -dm755 $pkgdir/usr/share/eclipse/dropins/${pkgname}/features
  install -dm755 $pkgdir/usr/share/eclipse/dropins/${pkgname}/plugins
  install -Dm644 features/codetrails.feature_0.6.0.jar $pkgdir/usr/share/eclipse/dropins/${pkgname}/features/
  install -Dm644 features/jd.edi.eclipse.feature_$pkgver.jar $pkgdir/usr/share/eclipse/dropins/${pkgname}/features/
  install -Dm644 features/realignment.jd.ide.eclipse.feature_1.1.2.jar $pkgdir/usr/share/eclipse/dropins/${pkgname}/features/
  install -Dm644 plugins/codetrails_0.6.0.jar $pkgdir/usr/share/eclipse/dropins/${pkgname}/plugins/
  install -Dm644 plugins/jd.ide.eclipse_$pkgver.jar $pkgdir/usr/share/eclipse/dropins/${pkgname}/plugins/
  install -Dm644 plugins/jd.ide.eclipse.linux.x86_$pkgver.jar $pkgdir/usr/share/eclipse/dropins/${pkgname}/plugins/
  install -Dm644 plugins/jd.ide.eclipse.linux.x86_64_$pkgver.jar $pkgdir/usr/share/eclipse/dropins/${pkgname}/plugins/
  install -Dm644 plugins/realignment.jd.ide.eclipse_1.1.2.jar $pkgdir/usr/share/eclipse/dropins/${pkgname}/plugins/
}
