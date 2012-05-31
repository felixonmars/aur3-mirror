# Contributor:  titiwu
# Maintainer: titiwu
pkgname=jlatexeditor
pkgver=2.10
pkgrel=1
pkgdesc="Intelligent and configurable open source LaTeX editor written in Java."
url="http://jlatexeditor.endrullis.de/"
arch=('any')
license=('GPL')
depends=('java-runtime' 'texlive-bin' 'texlive-core')
optdepends=('aspell: live spell checking'
            'hunspell: live spell checking'
            'subversion: svn support')
install=jlatexeditor.install
source=(http://endrullis.de/JLatexEditor/releases/JLatexEditor-latest.tar.gz jlatexeditor jlatexeditor.png jlatexeditor.desktop)
md5sums=('8566dbbac0804ed5b30bdc2696e83c39'
         '1baa11993c999c112a7f16c2089dc58c'
         '02a528ac45a44c42a280af6d69c211c7'
         '9843de020852935ebf1fed3893ea5e38')

build() {
  cd $srcdir/
  install -d $pkgdir/usr/share/{applications,pixmaps} || return 1
  install -d  $pkgdir/usr/share/$pkgname
  cp -R $srcdir/JLatexEditor/* $pkgdir/usr/share/$pkgname
  chmod 755 $pkgdir/usr/share/$pkgname/$pkgname
  install -Dm755 $srcdir/$pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps || return 1
  install -Dm644 $startdir/$pkgname.desktop $pkgdir/usr/share/applications || return 1
}

