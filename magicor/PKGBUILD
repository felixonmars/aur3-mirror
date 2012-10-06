# Maintainer: Gadget3000 <gadget3000 at msn dot com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Dominika Solarz <dominikasolarz@gmail.com>
# Contributor: Dany Martineau <dany.luc.martineau at gmail.com>
# Contributor : giacomogiorgianni@gmail.com

pkgname=magicor
pkgver=1.1
pkgrel=3
pkgdesc="An old-school, puzzle game similar to Solomon's Key"
arch=('any')
url="http://magicor.sourceforge.net/"
license=('GPL')
depends=('python2-pygame' 'python2')
optdepends=('pygtk: for level editor')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-source-$pkgver.tar.gz
        http://downloads.sourceforge.net/$pkgname/$pkgname-data-$pkgver.tar.gz magicor.desktop)
md5sums=('0ba83ba61ec7db1a0d4fed6b937ae527'
         'b681fc820d0f900120a87ae6163ee777' 
         '55e4edabd8a38dd35006429c0cb7e7b1'  )

_sitepackages=$(python2 -c \
  "from distutils.sysconfig import get_python_lib; \
   print get_python_lib()")

build() {
  cd "$srcdir"/$pkgname-$pkgver

  # install python files
  install -m755 -d "$pkgdir"/$_sitepackages/$pkgname
  cp -rf magicor/* "$pkgdir"/$_sitepackages/$pkgname

  # install launchers
  sed -i "s,###CONFIG_PATH###,/etc/$pkgname/$pkgname.conf," Magicor.py
  sed -i "s/\#\!\/usr\/bin\/python/\#\!\/usr\/bin\/python2/" Magicor.py
  sed -i "s,###CONFIG_PATH###,/etc/$pkgname/$pkgname-editor.conf," Magicor-LevelEditor.py
  sed -i "s/\#\!\/usr\/bin\/python/\#\!\/usr\/bin\/python2/" Magicor-LevelEditor.py
  install -Dm755 Magicor.py "$pkgdir"/usr/bin/$pkgname
  install -Dm755 Magicor-LevelEditor.py "$pkgdir"/usr/bin/$pkgname-leveleditor

  # install config
  sed -i "s,###SHARE_PATH###,/usr/share/$pkgname," etc/*.conf
  install -m755 -d "$pkgdir"/etc/$pkgname
  install -m644 -t "$pkgdir"/etc/$pkgname etc/*.conf

  # install data
  install -m755 -d "$pkgdir"/usr/share/$pkgname
  cp -rf data/* "$pkgdir"/usr/share/$pkgname

  # install license
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  # set permissions
  find "$pkgdir"/$_sitepackages/$pkgname -type d -exec chmod 755 {} +
  find "$pkgdir"/$_sitepackages/$pkgname -type f -exec chmod 644 {} +
  find "$pkgdir"/usr/share/$pkgname -type d -exec chmod 755 {} +
  find "$pkgdir"/usr/share/$pkgname -type f -exec chmod 644 {} +

  # install menu items
  mkdir -p "$pkgdir"/usr/share/applications
  install ../magicor.desktop "$pkgdir"/usr/share/applications
}
