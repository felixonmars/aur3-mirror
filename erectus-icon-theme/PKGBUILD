# Mantainer: Diego <cdprincipe@at@gmail@dot@com>
# Contributor: grimi <grimi at poczta dot fm>

pkgname=erectus-icon-theme
pkgver=1.2
pkgrel=2
pkgdesc="Inspired by Ubuntu Human icons, complete icon set for Gnome"
arch=('any')
url="http://www.gnome-look.org/content/show.php/Erectus?content=100254"
license=('GPL')
source=("http://dl.getdropbox.com/u/1541424/ErectusIcons/erectus1.2_by_jonian_olibia.tar.gz" \
        "archpkg.svg")
md5sums=('83af719db92d152a616f41cfaaff3c1b' '02d28e011d443805545257dbc23d7a2e')

package() {
  cd "$srcdir"
  
  # Create destination folder
  install -d "$pkgdir"/usr/share/icons
  
  # Install icon theme
  cp -r erectus "$pkgdir"/usr/share/icons
  find $pkgdir/usr/share/icons/erectus -type f -print|xargs chmod 644 # no exec bit for files
  install -m644 $srcdir/archpkg.svg "$pkgdir"/usr/share/icons/erectus/scalable/mimetypes/application-x-archpkg.svg
}

