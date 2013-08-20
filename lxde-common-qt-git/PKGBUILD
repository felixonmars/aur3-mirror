pkgname=lxde-common-qt-git
_gitname=lxde-common-qt
pkgver=54f1e16
pkgrel=3
pkgdesc="Default configuration and data files required to run LXDE-Qt"
url="http://lxde.git.sourceforge.net"
arch=('any')
license=('GPL2')
depends=('libx11' 'glib2' 'gtk-update-icon-cache')
optdepends=('openbox: for window manager'
            'pcmanfm-qt-git: for file manager'
            'razor-qt-git: for main panel'
            'lxpanel-qt-git: for panel'
            'lxsession-git: for session manager'
            'oxygen-icons: for icon theme')
makedepends=('automake' 'git')
conflicts=('lxde-common' 'lxde-common-git')
backup=(etc/xdg/lxsession/LXDE-Qt/desktop.conf
        etc/xdg/lxsession/LXDE-Qt/autostart)
install='lxde-common-qt-git.install'
source=("lxde-common-qt::git://lxde.git.sourceforge.net/gitroot/lxde/lxde-common-qt"
        "openbox-lxde")
md5sums=('SKIP'
         'c3869fe62f3ce9da41ae6b492d2de8ba')


pkgver() {
  cd "$_gitname"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$srcdir/$_gitname" 
  autoreconf --install
  ./configure --sysconfdir=/etc --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" install
  install -Dm644 lxde-logout-qt.desktop \
  "$pkgdir/usr/share/applications/lxde-logout-qt.desktop"
  install -Dm755 "$srcdir/openbox-lxde" "$pkgdir/usr/bin/openbox-lxde"

  ## fixes false to launch openbox
  sed -i 's@openbox --config-file $XDG_CONFIG_HOME/openbox/lxde-rc.xml@openbox-lxde@' \
  "$pkgdir/etc/xdg/lxsession/LXDE-Qt/desktop.conf"
}
