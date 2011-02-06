# Contributor: Cilyan Olowen <gaknar@gmail.com>
arch=(i686 x86_64)
pkgname=desigle-svn
pkgver=41
pkgrel=1
pkgdesc="Derek's Simple Gnome LaTeX Editor. A simple GTK-based LaTeX editor \
with spell checking, syntax highlighting, auto-complete and a PDF preview pane."
url="http://code.google.com/p/desigle/"
license=('GPL2')

depends=('gnome-python-extras' 'gtkspell' 'python-poppler' 'texlive-core')
makedepends=('subversion')
conflicts=('desigle')
provides=('desigle')

source=()
md5sums=()

_svntrunk=http://desigle.googlecode.com/svn/trunk/
_svnmod=desigle

build() {
  cd ${srcdir}

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  
  msg "SVN checkout done or server timeout"
  
  cd $_svnmod
  
  msg "Moving files..."
  install -d ${pkgdir}/usr/share/desigle
  install -m 0644 *.py ${pkgdir}/usr/share/desigle
  chmod 0755 ${pkgdir}/usr/share/desigle/desigle.py
  install -m 0644 desigle.glade ${pkgdir}/usr/share/desigle/
  install -m 0644 SYMLIST ${pkgdir}/usr/share/desigle/
  ln -s /usr/share/licenses/common/GPL2/license.txt ${pkgdir}/usr/share/desigle/GPL.txt
  
  msg "Creating menu entry..."
  install -d ${pkgdir}/usr/share/applications
  _menufile="${pkgdir}/usr/share/applications/desigle.desktop"
  echo "[Desktop Entry]" > $_menufile
  echo "Type=Application" >> $_menufile
  echo "Version=1.0" >> $_menufile
  echo "Encoding=UTF-8" >> $_menufile
  echo "Name=DeSiGLE" >> $_menufile
  echo "GenericName=DeSiGLE LaTeX Editor" >> $_menufile
  echo "GenericName[en]=DeSiGLE LaTeX Editor" >> $_menufile
  echo "GenericName[fr]=Éditeur LaTeX DeSiGLE" >> $_menufile
  echo "Exec=desigle" >> $_menufile
  echo "Terminal=false" >> $_menufile
  echo "StartupNotify=false" >> $_menufile
  echo "Categories=Office" >> $_menufile
  chmod 0644 $_menufile
  
  msg "Creating launcher..."
  install -d ${pkgdir}/usr/bin/
  _launchfile="${pkgdir}/usr/bin/desigle"
  echo "#!/bin/sh" > $_launchfile
  echo "cd /usr/share/desigle" >> $_launchfile
  echo "python desigle.py \$@" >> $_launchfile
  chmod 0755 $_launchfile
  
}
# vim:syntax=sh
