# Mantainer: Diego <cdprincipe@at@gmail@dot@com>
# Contributor: grimi <grimi at poczta dot fm>

pkgname=chromo-erectus-icon-themes
pkgver=1.2
pkgrel=1
pkgdesc="Inspired by Ubuntu Human icons, complete icon set for Gnome (extra colors)"
arch=('any')
url="http://www.gnome-look.org/content/show.php/Chromo-Erectus?content=101194"
license=('GPL')
source=("http://dl.getdropbox.com/u/1541424/Chromo-ErectusIcons/chromo-erectus_by_olibia_jonian.tar.gz" \
        "archpkg.svg")
md5sums=('e5b9c535720364dcf949fe9255a4469e' '02d28e011d443805545257dbc23d7a2e')

package() {
  cd "$srcdir"
  
  # Create deestination folder
  install -d $pkgdir/usr/share/icons
  
  # Install icon themes
  for i in blue brown green violet; do
     cp -r erectus-$i $pkgdir/usr/share/icons
     find $pkgdir/usr/share/icons/erectus-${i} -type d -print|xargs chmod 755  # fix dirs attributes
     find $pkgdir/usr/share/icons/erectus-${i} -type f -print|xargs chmod 644  # no exec bit for files
     install -m644 $srcdir/archpkg.svg $pkgdir/usr/share/icons/erectus-$i/scalable/mimetypes/application-x-archpkg.svg
  done
}

