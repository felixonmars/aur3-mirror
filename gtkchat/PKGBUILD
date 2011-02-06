# Contributor: Cilyan Olowen <gaknar@gmail.com>
pkgname=gtkchat
pkgver=0.60
_tarballname=GtkChat
pkgrel=1
pkgdesc="GtkChat is GTK+ based Vypress Chat TM clone. It uses GTK 2 and it's Perl bindings."
arch=('i686' 'x86_64')
url="http://gtkchat.berlios.de/"
license=('GPL')
depends=('gtk2>=2.2' 'perl>=5.8.0' 'gtk2-perl' 'glade-perl' 'perl-yaml' \
    'perl-vypress')
source=(http://download2.berlios.de/$pkgname/$_tarballname-$pkgver.tar.bz2)
md5sums=('0db4d1245e486b302b644b9faa438a1a')

build() {
  cd "$startdir/src/$_tarballname"

  # Rewriting install.sh because it is not suitable for PKGBUILDs
  _prefix=$startdir/pkg/usr
  _appsdir=$_prefix/share/applications
  _pixdir=$_prefix/share/pixmaps
  _bindir=$_prefix/bin
  _filedir=$_prefix/share/gtkchat
  
  install -m 755 -d $_prefix
  install -m 755 -d $_appsdir
  install -m 755 -d $_pixdir
  install -m 755 -d $_bindir
  install -m 755 -d $_filedir
  
  install -m 644 gtkchat.desktop $_appsdir
  install -m 644 gtkchat.png $_pixdir
  install -m 755 src/bin/* $_bindir
  install -m 644 src/share/gtkchat/gtkchat.{cfg.yaml,glade} $_filedir 
  install -m 755 -d $_filedir/pixmaps
  install -m 644 src/share/gtkchat/pixmaps/* $_filedir/pixmaps
  install -m 755 -d $_filedir/Sys
  install -m 644 src/share/gtkchat/Sys/* $_filedir/Sys
  
}

# vim:set ts=2 sw=2 et:
