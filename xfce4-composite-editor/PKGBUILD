# Contributor: Martin F. Schumann <mfs@mfs.name>

pkgname=xfce4-composite-editor
pkgver=1.0
pkgrel=2
pkgdesc="A simple GUI to control various xfce4 WM tweaks"
url="http://keithhedger.hostingsiteforfree.com/pages/apps.html#xfcecomp"
license="GPL"
arch=(i686 x86_64)
depends=('bash' 'gtkdialog>=0.8.0')
makedepends=()
source=("http://dl.mfs.name/Xfce4-Composite-Editor.tar.gz")
md5sums=('6fd96c79bd0562a4dbdbcde430da108c')

package() {
  mkdir -p $pkgdir/usr/bin $pkgdir/usr/share/applications
  cd $srcdir
  mv xfce4-composite-editor $pkgdir/usr/bin/
  sed 's/Name=Xfce4-Composite-Editor/Name=Xfce4 Composite Editor/g;s/^Comment.*/Comment=Control the Compositing Settings of the Xfce4 WM/g' xfcecomped.desktop > xfce4-composite-editor.desktop
  mv xfce4-composite-editor.desktop $pkgdir/usr/share/applications/
}
