# Contributor: twa022 <twa022 at gmail dot com>

pkgname=dockbarx-bzr
_pkgname=dockbarx
pkgver=536
pkgrel=1
pkgdesc="TaskBar with groupping and group manipulation"
arch=('i686' 'x86_64')
url="https://code.launchpad.net/~dockbar-main/dockbar/experimental"
license=('GPL3')
depends=('python2-wnck' 'pygtk' 'python2-xdg' 'python2-dbus' 'python2-numpy' 
         'python2-pillow' 'python2-keybinder2' 'hicolor-icon-theme' 'python2-xlib'
         'python2-gconf')
optdepends=('avant-window-navigator: AWN DockBarX Plugin'
            'xfce4-dockbarx-plugin: Xfce4 Panel Plugin'
            'zeitgeist: recently used file list'
            'compiz-fusion-plugins-main: opacify plugin'
            'dockmanager: dockmanager plugins'
            'cardapio-bzr: required to run menu applet for dockx (standalone dock)')
makedepends=('bzr')
conflicts=('dockbarx' 'dockbarx-awn-applet-bzr')
replaces=('dockbarx-awn-applet-bzr')
provides=('dockbarx=0.91')
source=("${_pkgname}"::bzr+https://code.launchpad.net/~dockbar-main/dockbar/experimental)

pkgver() {
  cd $srcdir/${_pkgname}
  bzr revno
}

package() {
  cd ${srcdir}/${_pkgname}

  python2 setup.py install --root ${pkgdir}

  mkdir -p ${pkgdir}/usr/share/avant-window-navigator/applets
  cp -r ${srcdir}/${_pkgname}/AWN/* ${pkgdir}/usr/share/avant-window-navigator/applets
  
  mkdir -p ${pkgdir}/usr/share/pixmaps
  install -Dm644 ${srcdir}/${_pkgname}/icons/hicolor/128x128/apps/dockbarx.png ${pkgdir}/usr/share/pixmaps/dockbarx.png

  sed -i 's:^Categories=.*:Categories=GTK;GNOME;Settings;X-GNOME-PersonalSettings;:' ${pkgdir}/usr/share/applications/dbx_preference.desktop
}

sha256sums=('SKIP')
