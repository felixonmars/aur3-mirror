# Maintainer: Olav "lafka" Frengstad <olav@wavephp.net>

pkgname=gnome-panel-ubuntu
_pkgname=gnome-panel
pkgver=2.30.2
pkgrel=1.01
pkgdesc="Patches for the launcher and docking facility for GNOME "
arch=('i686')
url="launcher and docking facility for GNOME"
license=('GPL')
groups=('ayatana')
depends=('gnome-desktop>=2.30.2')
makedepends=('gnome-doc-utils>=0.16.1' 'pkgconfig' 'intltool')
provides=('gnome-panel' 'gnome-panel-data')
replaces=('gnome-panel')
source=(http://launchpad.net/ubuntu/+archive/primary/+files/gnome-panel_2.30.2.orig.tar.gz 
01_layout.patch
03_dnd_places_link.patch
04_default_panel_config.patch
05_no_session_delay.patch
09_default_icons.patch
16_compiz_workspace_switcher.patch
17_about-ubuntu-translation.patch
18_lockdown_lock_editor.patch
25_dynamic_fusa_detection.patch
30_disable-initial-animation.patch
40_unset_menuproxy.patch
71_change_bookmark_submenu_limit_value.patch
85_disable_shutdown_on_ltsp.patch
90_git_wnck_show_realize.patch
91_git_wnck_pager_update.patch
99_ltmain_as-needed.patch
)
md5sums=('ea653aa2d5c12c652377989629fa9c10'
	'4f04a5a5f474fe3c7f62d601e774e05f'
	'2a5a3b1fc89215b014adad75ecb44dd3'
	'a620a4f63841b042d53106508d33d840'
	'c3cc7e04a12092720da35a7ed92e1bcc'
	'8847de988e7872c0465cf164969306be'
	'ae2237d598602b64b56d04026190ff1d'
	'7e5980210f0133fc88e0adcc22429f11'
	'7d3ae7d88a64a73580aa688b4b2abed9'
	'bb9940b02e498094542cc7689f144f58'
	'bb50fed2ecf601a278079d01aa6192e3'
	'6c09095a68df9ca512e7717c115b2a95'
	'09a2e6ae9dcfc0d1e06b7189635e34d5'
	'4c81e90ee0c4b626abbe0ce08496b3f0'
	'34b50f3c0d9f9dfb711b70bc70b5967a'
	'e3874ac8e0dab56f295064f0492b66b3'
	'c71805027eca214516725ff8c9f9fa76'
)
url="https://launchpad.net/ubuntu/+source/gnome-panel"
build() {
  cd $srcdir/$_pkgname-$pkgver
  ls -1 ../*.patch | xargs -iXXX patch -Np1 -i XXX
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
	--libexecdir=/usr/lib --with-default-wm=fusion-icon
  make || return 1
  make prefix=$pkgdir/usr install
}
