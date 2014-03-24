# Maintainer: David Spicer <azleifel at gmail dot com>

pkgname=vdr-xineliboutput-cvs
_pluginname=xineliboutput
pkgver=20140323
pkgrel=1
pkgdesc="A VDR plugin that allows VDR to be used with budget cards"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/xineliboutput/"
license=('GPL2')
depends=('dbus-glib' 'libextractor' 'libxrandr' 'mesa' 'vdr>=2.0.0' 'xine-lib')
makedepends=('cvs')
optdepends=('xine-ui: An alternative frontend')
provides=('vdr-xineliboutput')
conflicts=('vdr-xineliboutput')
backup=('var/lib/vdr/plugins/xineliboutput/allowed_hosts.conf')
install=$pkgname.install
source=(vdr-sxfe.desktop
        vdr-xine-ui.desktop)
md5sums=('de4b514c2a5e6d84dc4b87ea3b9fde9e'
         '2d5cef1e40a5c7b920ea75c3d129c61f')

_cvsroot=":pserver:anonymous:@xineliboutput.cvs.sourceforge.net:/cvsroot/xineliboutput"
_cvsmod="vdr-$_pluginname"

pkgver() {
  date +"%Y%m%d"
}

build() {
  cd "$srcdir"
  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."

  if [[ -d "$_cvsmod/CVS" ]]; then
    cd "$_cvsmod"
    cvs -z3 update -d
  else
    cvs -z3 -d "$_cvsroot" co -D "$pkgver" -f "$_cvsmod"
    cd "$_cvsmod"
  fi

  msg "CVS checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_cvsmod-build"
  cp -r "$srcdir/$_cvsmod" "$srcdir/$_cvsmod-build"
  cd "$srcdir/$_cvsmod-build"

  make
}

package() {
  cd "$srcdir/$_cvsmod-build"

  # VDR directory environment
  _vdrCONFDIR="/var/lib/vdr"
  _vdrINCDIR="/usr/include"
  _vdrLIBDIR="/usr/lib/vdr"
  _vdrLOCDIR="/usr/share/locale"

  # Create install directories
  install -d -m755 "$pkgdir/$_vdrLIBDIR"
  install -d -m755 "$pkgdir/$_vdrLOCDIR"

  # Install plugin
  # Define PREFIX (same as DESTDIR) to work around a Makefile issue
  make DESTDIR="$pkgdir/" PREFIX="$pkgdir/" install

  # Install configuration etc. files
  install -d -m755 "$pkgdir/$_vdrCONFDIR/plugins/$_pluginname"
  install -m644 examples/allowed_hosts.conf "$pkgdir/$_vdrCONFDIR/plugins/$_pluginname"
  
  # Install documents and example remote.conf
  install -d -m755 "$pkgdir/usr/share/doc/$pkgname"
  for _file in HISTORY README examples/remote.conf.example; do
    install -m644 "$_file" "$pkgdir/usr/share/doc/$pkgname/${_file##*/}"
  done
  
  # Install desktop files
  install -d -m755 "$pkgdir/usr/share/applications"
  install -m644 "$srcdir/vdr-sxfe.desktop" "$pkgdir/usr/share/applications"
  install -m644 "$srcdir/vdr-xine-ui.desktop" "$pkgdir/usr/share/applications"
}
