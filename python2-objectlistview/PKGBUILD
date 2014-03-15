# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=python2-objectlistview
pkgver=1.2
pkgrel=4
pkgdesc="Wrapper around the wx.ListCtrl that makes the list control easier to use."
arch=('any')
url="http://objectlistview.sourceforge.net/python/"
license=('wxWindows')
depends=('python2')
source=(http://prdownloads.sourceforge.net/objectlistview/ObjectListView-$pkgver-without-graphics.zip)
md5sums=('4012863eb68b5ec05d2c540a04629cbb')

prepare() {
   cd $srcdir/ObjectListView-$pkgver/ObjectListView

   # Patch to fix RefreshItems bug
   sed -i 's|self.RefreshItems(0, self.GetItemCount()-1)|if self.GetItemCount() > 0:self.RefreshItems(0, self.GetItemCount()-1)|' ObjectListView.py
   sed -i 's|self.RefreshItems(0, self.GetItemCount() - 1)|if self.GetItemCount() > 0:self.RefreshItems(0, self.GetItemCount() - 1)|' ObjectListView.py
}

package() {
   cd $srcdir/ObjectListView-$pkgver
   python2 setup.py install --root $pkgdir --optimize=1

   # License
   install -Dm644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}