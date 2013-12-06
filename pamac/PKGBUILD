# Maintainer: Guillaume Benoit <guillaume@manjaro.org>

pkgname=pamac
pkgver=0.9.0
pkgrel=1
pkgdesc="A gtk3 frontend for pyalpm"
arch=(any)
url="https://git.manjaro.org/core/pamac"
license=('GPL')
depends=('python>=3.3' 'python<3.4' 'pacman>=4.1' 'pyalpm=0.6.2.1' 'gtk3>=3.6' 'python-gobject' 'python-dbus' 'dbus-glib' 'libnotify')
## needed for AUR support
#depends=('python>=3.3' 'python<3.4' 'pacman>=4.1' 'pyalpm=0.6.2.1' 'gtk3>=3.6' 'python-requests' 'python-gobject' 'python-dbus' 'dbus-glib' 'libnotify' 'namcap')
optdepends=('polkit-gnome: needed for authentification in Cinnamon, Gnome' 'lxpolkit: needed for authentification in Xfce, LXDE etc.')
makedepends=('gettext' 'itstool' 'git')
options=(!emptydirs)
install=$pkgname-install
_git=no
_snapshot=b15b18595731aad76fec06e0390ce329185daaf3

if [ "$_git" == "Yes" ]; then
   source=(git+http://git.manjaro.org/core/pamac.git)
   sha256sums=('SKIP')
else
   #source=("pamac-$pkgver.tar.gz::http://git.manjaro.org/core/pamac/repository/archive?ref=v$pkgver")
   #sha256sums=('95816172978ef49dfd760c77d2badba7942571240aa28c12a584f88bc56cf961')
   source=("pamac-$pkgver.tar.gz::http://git.manjaro.org/core/pamac/repository/archive?ref=$_snapshot")
   sha256sums=('c9287a7d65157bbb454f25009e67039ac60f7ef28308e5eabca07c92973d9d63')
fi

package() {
  if [ -e "$srcdir/core-$pkgname" ]; then
	   cd "$srcdir/core-$pkgname"
  fi
  if [ -e "$srcdir/$pkgname" ]; then
     cd "$srcdir/$pkgname"
  fi
  if [ -e "$srcdir/$pkgname.git" ]; then
	   cd "$srcdir/$pkgname.git"
  fi

  # fix version
  sed -i 's|'0.9'|'0.9.0'|g' pamac-manager.py

	python setup.py install --root="$pkgdir/" --optimize=1
	mkdir -p "${pkgdir}/usr/share/pamac"
	cp -r "gui" "${pkgdir}/usr/share/pamac"
	cp -r "data/icons" "${pkgdir}/usr/share/pamac"
	cp -r "data/applications" "${pkgdir}/usr/share/"
	cp -r "data/etc" "${pkgdir}/"
	install -Dm744 "pamac-daemon.py" "${pkgdir}/usr/bin/pamac-daemon"
	install -Dm755 "pamac-manager.py" "${pkgdir}/usr/bin/pamac-manager"
	install -Dm755 "pamac-updater.py" "${pkgdir}/usr/bin/pamac-updater"
	install -Dm755 "pamac-tray.py" "${pkgdir}/usr/bin/pamac-tray"
	install -Dm755 "pamac-refresh.py" "${pkgdir}/usr/bin/pamac-refresh"
	install -Dm755 "pamac-install.py" "${pkgdir}/usr/bin/pamac-install"
	install -Dm644 "data/dbus/org.manjaro.pamac.conf" "${pkgdir}/etc/dbus-1/system.d/org.manjaro.pamac.conf"
	install -Dm644 "data/dbus/org.manjaro.pamac.service" "${pkgdir}/usr/share/dbus-1/system-services/org.manjaro.pamac.service"
	install -Dm644 "data/systemd/pamac.service" "${pkgdir}/usr/lib/systemd/system/pamac.service"
	install -Dm744 "data/networkmanager/99_update_pamac_tray" "${pkgdir}/etc/NetworkManager/dispatcher.d/99_update_pamac_tray"
	# create .mo translation files
	mkdir -p mo
	for i in `ls po | sed s'|.po||'` ; do
		msgfmt -c "po/$i.po" -o "mo/$i.mo"
	done
	# add translation in policy file
	itstool -j "data/polkit/org.manjaro.pamac.policy" -o "data/polkit/org.manjaro.pamac.policy.out" `ls mo/*`
	# rename mo files only here else istool failed
	for i in `ls mo | sed s'|.mo||'` ; do
		mkdir -p "${pkgdir}/usr/share/locale/$i/LC_MESSAGES/"
		mv "mo/$i.mo" "${pkgdir}/usr/share/locale/$i/LC_MESSAGES/pamac.mo"
	done
	install -Dm644 "data/polkit/org.manjaro.pamac.policy.out" "${pkgdir}/usr/share/polkit-1/actions/org.manjaro.pamac.policy"

}

# vim:set ts=2 sw=2 et:
