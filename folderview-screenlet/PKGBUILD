# Contributor: twa022 <twa022@gmail.com>

pkgname=folderview-screenlet
pkgver=0.9.9
pkgrel=2
pkgdesc="Folderview on Desktop (like KDE4)"
arch=('any')
url="http://gnome-look.org/content/show.php/Folderview+Screenlet?content=102890"
license=('GPL')
depends=('screenlets>=0.1.2' 'pygobject')
source=(http://gnome-look.org/CONTENT/content-files/102890-FolderView.tar.gz)

build() {
  mkdir -p $pkgdir/usr/share/screenlets
  sed -i 's:/usr/bin/env python:&2:g' ${srcdir}/FolderView/*py
  cp -r $srcdir/FolderView $pkgdir/usr/share/screenlets/
}

md5sums=('c01128c62ce2af62a32dbe666b93e573')
