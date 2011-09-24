# Author: half-left <http://half-left.deviantart.com/>
# Maintainer  sanderd17 < sanderd17 AT gmail DOT com >

 pkgname=gnome-shell-theme-elementary-single-user
 pkgver=1.1
 pkgrel=1
 pkgdesc="This is a GNOME Shell theme based on the Elementary GTK2 theme. No system wide installation."
 url="http://half-left.deviantart.com/art/GNOME-Shell-Elementary-251536124"
 license=('GPLv3' 'LGPLv2')
 arch=('any')
 depends=('gnome-shell')
 optdepends=('gnome-shell-extension-user-theme: User Theme extension for GNOME Shell'
 'gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
 source=('http://www.deviantart.com/download/251536124/gnome_shell___elementary_by_half_left-d45raik.zip'
 'http://eldermarco.fedorapeople.org/files/patches/gnome-shell-theme-elementary-1.1-fix-version.patch'
 )
 md5sums=('67f3053df73c81b5f3c0c0211fa33a45' '27a572031daca62806fcf16daa0ef1a8' )

 package() {
 cd "$srcdir/Elementary"
 patch -p1 < ../$pkgname-$pkgver-fix-version.patch
-single-user

 # License file (Copy and remove)
 mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
-single-user
 install -Dp -m0644 gnome-shell/LICENSE \
 "$pkgdir/usr/share/licenses/$pkgname"
-single-user
 rm -rf gnome-shell/LICENSE

 # Install the theme and remove backup files
 mkdir -p "$pkgdir/$HOME/.themes/Elementary/gnome-shell"
 install -Dp -m0644 gnome-shell/* \
 "$pkgdir/$HOME/.themes/Elementary/gnome-shell"
 find "$pkgdir" -name *~ -type f -exec rm -f '{}' \;
 }
