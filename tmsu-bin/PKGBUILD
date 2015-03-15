# Maintainer: Andreas Wagner <AndreasBWagner@pointfree.net>
pkgname=tmsu-bin
pkgver=0.5.2
pkgrel=2
pkgdesc="An application that allows you to tag your files to organize them."
arch=('i686' 'x86_64')
url="http://tmsu.org"
license=('GPL3')
provides=('tmsu')
install=${pkgname}.install
source=("${pkgname}.install"
        'https://raw.githubusercontent.com/oniony/TMSU/master/misc/db-upgrade/0.0.5_to_0.0.6.sql'
        'https://raw.githubusercontent.com/oniony/TMSU/master/misc/db-upgrade/0.0.9_to_0.1.0.sql'
        'https://raw.githubusercontent.com/oniony/TMSU/master/misc/db-upgrade/clean_tag_names.sql'
        'https://raw.githubusercontent.com/oniony/TMSU/master/misc/db-upgrade/0.3_to_0.4.0.sql' 
        'https://raw.githubusercontent.com/oniony/TMSU/master/misc/db-upgrade/migrate-tags-to-values' 
        "https://github.com/oniony/TMSU/releases/download/v${pkgver}/tmsu-${CARCH}-${pkgver}.tgz")
sha512sums=('984601cf3f628e498ecaa4d57b67bcb1fd1f9554b76abe464f5bc658c6b459863a7e598979d5253befd2151e54c998f5de5234174e71f3ee69f369c566c0c213'
            '1b59c03745c603b7e8b975c78ee83a9f920b60b15c63ddf965e242f34118410f2f381b7c2067a456a4ce32ed5829c0181e70279961f559340de5d46a0d06735b'
            '6660d1baa3e2a8a5f8e4853a90fe10052d72f979cbaacbe851b4514b6f945d490d47633550df61e22c470b576f6708a3ef3a577c1136e2cfd6630dbd182ad0f3'
            'fcf94113c4e198a629a26ce5aac0ffc6fcc05564dc5e517053d285b425cf5134d57e11bc5973ad5422e4781dfed596242c9488ef4133c75958ead74758424102'
            '1db86efff8a5839d17ae9bbd2a82c3a09a32f85c190346fdb7db60e3fc84a341f472dc8dae62ed2945f844c1a3d03830fae9eca41b4e111ebd4207b6fab58de1'
            '444a7146f9c2d119309b44762e204305365493ec766929d45bcb3133fdba893c96d4d07570bf5f1101f632e206081cd157c303204b8c75b2a0bc884c76adc128')
[ $CARCH == i686 ] && sha512sums+=('7e3b835c94198d278b5adaa37581cf0157e753ce169043fe3fe9bf83107906ca056c4056ff1de7468b12e8592b21e543fa1ad11f6b8c6814249fc293ae545aa9')
[ $CARCH == x86_64 ] && sha512sums+=('0ef2c5742c9fc2268b1d9f8c564ae395629c792282602614bfe00ff5d048ec095f5ab4832d73dd7de4e36b11770c0ce8dab3b95b723a90081571eb97388b7bba')

package() {
  cd "$srcdir/tmsu-${CARCH}-$pkgver/"
  mkdir -p $pkgdir/usr/{bin,share/zsh/site-functions/,man/man1/}
  install -Dm755 bin/tmsu $pkgdir/usr/bin/
  install -Dm755 bin/mount.tmsu $pkgdir/usr/bin/
  install -Dm644 misc/zsh/_tmsu $pkgdir/usr/share/zsh/site-functions/
  install -Dm644 man/tmsu.1.gz $pkgdir/usr/man/man1/
  mkdir $pkgdir/usr/share/tmsu/
  install -Dm644 $srcdir/0.0.5_to_0.0.6.sql $pkgdir/usr/share/tmsu/
  install -Dm644 $srcdir/0.0.9_to_0.1.0.sql $pkgdir/usr/share/tmsu/
  install -Dm644 $srcdir/clean_tag_names.sql $pkgdir/usr/share/tmsu/
  install -Dm644 $srcdir/0.3_to_0.4.0.sql $pkgdir/usr/share/tmsu/
  install -Dm644 $srcdir/migrate-tags-to-values $pkgdir/usr/share/tmsu/
}
# vim:set ts=2 sw=2 et:
