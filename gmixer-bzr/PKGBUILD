# Contributor: Alessio Biancalana <dottorblaster@gmail.com>
# Contributor: Delphos Dragon <gabriel@igualdadcomunicaciones.org>

pkgname=gmixer-bzr
pkgver=9
pkgrel=2
pkgdesc="Gmixer is a lightweight Python based gtk/gstreamer volume control, it looks like the gnome audio mixer but without gnome dependencies."
arch=('i686' 'x86_64')
url="http://www.listen-project.org/"
license=('GPL3')
depends=('python' 'pygtk'  'gstreamer0.10-python' 'python2-xlib')
makedepends=('gettext' 'pkgconfig' 'intltool' 'bzr')
provides=('gmixer')
conflicts=('gmixer')
install=gmixer.install
source=()
md5sums=()

_bzrtrunk=lp:gmixer
_bzrmod=gmixer

build() {
  cd ${srcdir}
  if [ -d "${srcdir}/${_bzrmod}" ] ; then
  cd ${_bzrmod} && bzr up
  msg "The local files are updated."
  else
  bzr checkout ${_bzrtrunk}
  fi


  msg "BZR checkout done or server timeout"
  msg "Starting make..."

  cd $_bzrmod
  python2 setup.py install --root=${pkgdir} || return 1
 
}
