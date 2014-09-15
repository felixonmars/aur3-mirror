# Contributor: Carlos Jenkins <cjenkins@softwarelibrecr.org>
# Contributor: fabmen
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname='nested'
pkgver='1.4'
pkgrel='1'
pkgdesc="Specialized editor focused on creating structured documents"
arch=('any')
url='http://nestededitor.sourceforge.net'
license=('GPL')
depends=('python2>=2.7' 'pygtk>=2.24' 'gnome-python-desktop' 'gtksourceview2' 'python2-pyenchant')
optdepends=('pywebkitgtk' 'python2-gtkspellcheck' 'texlive-publishers' 'texlive-core' 'texive-bin' 'texlive-latexextra' 'rubber' 'iso-codes')
source=('nested-1.4.tar.gz::https://codeload.github.com/carlos-jenkins/nested/tar.gz/v1.4')
md5sums=('15d15ac2e47bef3dee19d7abb4ad76ab')
makedepends=('gendesk')

prepare(){
  cd $pkgname-$pkgver
  sed -i 's+import Image+from PIL import Image+' nested/nested_gui.py
}

build(){
  cd "$srcdir"
  gendesk -f -n
  cd "$pkgname-$pkgver/l10n"
  python2 compile_mo.py
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 "dist/fedora/$pkgname.desktop" \
	  "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "website/content/images/$pkgname.png" \
	  "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -d $pkgdir/usr/share/$pkgname/locales
  for _i in es.po pt_BR.po ru_RU.po
  do
    install -Dm644 l10n/po/$_i  "$pkgdir/usr/share/$pkgname/locales/$_i"
  done
}

