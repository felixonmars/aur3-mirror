# Maintainer: ZaZam <sami ät openmailbox döt org>

pkgname=generally2
pkgver=demo2
pkgrel=1
pkgdesc="A top-down arcade racing game"
arch=('x86_64')
license=('custom')
url="http://gene-rally.com/"
source=('https://s3-eu-west-1.amazonaws.com/gr2ksdemo1/GR2_KS_Demo_2_Linux.zip' 'generally2.desktop' 'LICENSE')
noextract=('GR2_KS_Demo_2_Linux.zip')
depends=('glu')
makedepends=('unzip')
sha512sums=('6960d49dd8e6517ebeb80f4327017bc4a8f30edf8627c13445d8412d9192158ce5e635d06cdc6e200eba03e1689a741a9041f4b94cdb52adf5016ea69452a984' 'd50203d6c7d3dda70e53cf44fb66e10b2e13605a51e6befbbd5d5e36e1062c67d9809f1801d706151908ee35ac300beb7b02922d71c7ce4148f001970160d1f0' '9c4d0aa0aa05eb1f729c9cc19b700535725a05a6baca8f66a4d2a610cf317b82733dda4f03c32cb4514f6564f5f1a7d9341efb7e175c54d785b3daad964c8b5e')

prepare() {
unzip GR2_KS_Demo_2_Linux.zip
}

package() {
  cd "$srcdir/GR2 KS Demo 2 - Linux/"
  # Install the compiled app to /opt
  install -Dm755 GR2_KS_Demo.x86_64 $pkgdir/opt/$pkgname/GR2_KS_Demo.x86_64
  cp -r GR2_KS_Demo_Data $pkgdir/opt/$pkgname/
  # Create a symlink to /usr/bin
  install -dm755 $pkgdir/usr/bin/
  ln -s /opt/$pkgname/GR2_KS_Demo.x86_64 $pkgdir/usr/bin/$pkgname
  # Install the icon
  install -Dm644 GR2_KS_Demo_Data/Resources/UnityPlayer.png $pkgdir/usr/share/pixmaps/$pkgname.png
  # Install the desktop entry
  cd $srcdir
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  # Install the license
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}