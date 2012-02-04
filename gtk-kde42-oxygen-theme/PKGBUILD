pkgname=gtk-kde42-oxygen-theme
_pkgname=kde42-oxygen
pkgver=0.3
pkgrel=2
pkgdesc='KDE4 Oxygen Theme Ported to GTK+'
arch=('i686' 'x86_64')
depends=('gtk-engines' 'gtk-engine-murrine')
license=('GPL')
url=('http://gnome-look.org')
source=($url/CONTENT/content-files/99926-kde42-oxygen.tar.gz)
md5sums=('58bf2d9c527847d88561ef19847d1a84')

build() 
{
  cd $startdir/src/$_pkgname

  mkdir -p $startdir/pkg/usr/share/themes/$_pkgname
  cp -R ./* $startdir/pkg/usr/share/themes/$_pkgname
  cd $startdir/pkg/usr/share/themes/$_pkgname
  chmod 755 $startdir/pkg/usr/share/themes/$_pkgname
  find . -type f | xargs chmod 644
  find . -type d | xargs chmod 755
}

# vim:set ts=2 sw=2 et:
