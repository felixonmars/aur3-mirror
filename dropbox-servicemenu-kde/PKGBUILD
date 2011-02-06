# Maintainer: (epsilom) Xavier Corredor <xavier.corredor.llano (a) gmail.com>
# based on http://kde-apps.org/content/show.php?content=115336&forumpage=0

pkgname=dropbox-servicemenu-kde
pkgver=0.2
pkgrel=2
pkgdesc="Is a KDE service menu for Dropbox for get URL of files in dropbox public directory"
url="http://kde-apps.org/content/show.php?content=115336&forumpage=0"
license=('GPL')
arch=('i686' 'x86_64')
depends=('dropbox' 'python')
source=('dropbox.desktop')
md5sums=('77f8730062c1635f55903f4b8b678942')

build() {

  wget https://www.dropbox.com/download?dl=packages/dropbox.py  || return 1
  install -D -m 644 "$srcdir/dropbox.py" "$pkgdir/opt/dropbox/servicemenu/dropbox.py"  
  
  install -D -m 644 "$startdir/dropbox.desktop" "$pkgdir/usr/share/kde4/services/ServiceMenus/dropbox.desktop"

}
