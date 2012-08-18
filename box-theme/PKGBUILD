# Contributor: nbvcxz <nbvcxz at o2 dot pl>
pkgname=box-theme
pkgver=1
pkgrel=3
pkgdesc="Lubuntu Quantal theme"
arch=('i686' 'x86_64')
url="https://wiki.ubuntu.com/Lubuntu/Artwork/Incoming/Quantal/Box"
license=('GPL')
optdepends=('elementary-icons: matching icon set')
source=('Trolltech.conf'
        'https://wiki.ubuntu.com/Lubuntu/Artwork/Incoming/Quantal/Box?action=AttachFile&do=get&target=box_theme.tar.gz'
        'https://wiki.ubuntu.com/Lubuntu/Artwork/Incoming/Quantal/Box?action=AttachFile&do=get&target=panel_button.png'
        'https://wiki.ubuntu.com/Lubuntu/Artwork/Incoming/Quantal/Box?action=AttachFile&do=get&target=panel_background.png'
        'https://wiki.ubuntu.com/Lubuntu/Artwork/Incoming/Quantal/Box?action=AttachFile&do=get&target=wall_stripped.png'
        'https://wiki.ubuntu.com/Lubuntu/Artwork/Incoming/Quantal/Box?action=AttachFile&do=get&target=wall_unstripped.png')

md5sums=('f60d960a82a256215954b5d4a0ea62b2'
         'd389cb4f3458803c59a4cf9c24ea59dd'
         '707bf73758125c528f6c33d95267b21b'
         'd201a953be7c5f6af30db96af1fd9d22'
         '86d2f57d70ba9832e5030dc8e48424dc'
         '18aecd859ee43e7e8232db9a2036fb5f')
         
build() {
  cd $srcdir
 
  mkdir -p $pkgdir/usr/share/themes/Box
  cp -R $srcdir/Lubuntu-default/* $pkgdir/usr/share/themes/Box
  install -Dm644 $srcdir/*panel_button.png $pkgdir/usr/share/themes/Box/panel_button.png
  install -Dm644 $srcdir/*panel_background.png $pkgdir/usr/share/themes/Box/panel_background.png
  install -Dm644 $srcdir/*wall_stripped.png $pkgdir/usr/share/backgrounds/box-wall-stripped.png
  install -Dm644 $srcdir/*wall_unstripped.png $pkgdir/usr/share/backgrounds/box-wall-unstripped.png
  install -Dm644 $srcdir/Trolltech.conf $pkgdir/usr/share/themes/Box/Trolltech.conf
}
