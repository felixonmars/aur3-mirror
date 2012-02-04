# Contributor: jianingy <jianingy.yang@gmail.com>

pkgname=bundle-desktop-jianingy
pkgrel=1
pkgver=0.05
pkgdesc="!!DONT USE!!. This package is not functional properly yet. Some configurations and packages for chinese UI tweak."
arch=('i686' 'x86_64')
url=('http://blog.jianingy.com')
license=('BSD')
backups=('/etc/slim.conf')
install=bundle-desktop-jianingy.install
depends=(
	'wget'
	'webcore-fonts'
	'slim' 'archlinux-themes-slim' 'gnome-do'
	'cairo-lcd' 'fontconfig-lcd' 'libxft-lcd' 'light-themes' 'ubuntu-mono'
	'rxvt-unicode-chinese'
	'emerald' 'emerald-themes'
	'fusion-icon' 'compiz-core' 'compiz-fusion-plugins-extra' 'compiz-fusion-plugins-main'
	'compiz-manager' 'compizconfig-backend-gconf' 'compizconfig-python'
	'gnomenu' 'ibus' 'ibus-pinyin'
)
source=(
	'Xdefault.local'
	'Ambiance.Emerald.BW.emerald'
	'45-restrict.conf'
	'slim.conf'
	'xinitrc.local'
	'fusion-icon'
	'compiz.ini'
	'gconf-panel.xml'
    'fusion-icon.desktop'
    'gnome-do.desktop'
	'http://www.gringod.com/wp-upload/software/Fonts/Monaco_Linux.ttf'
	'http://www.techmynd.com/wp-content/uploads/2009/03/starfield.png'

	'bundle-desktop-setup.sh'
)
sha1sums=(
	'9f50641b129eab8413d9bd28e052f8724772b2ea'
	'e5ba6bc35823dfe494ab2737d7c058135de7e107'
	'47a747f7b9d4e6548d01515c669a15515c2dcec3'
	'252be9b6f567a9418be61be91cb9c380171a6dce'
	'9c6ce480219eb9a969f624c4085cdd85cc39ac26'
	'63409c4177fd0324d2062479b37b8d44d81b4b88'
	'3788959f6e20b0f6e2ce08709b8895d62a7ac524'
	'9eae9814cca9c77b52ed8d7670bae1a0a1482b65'
	'68e455cbe29d4b0404052e4d8a6d0f648d99c830'
	'135e97f41e46c1e0fde0e3b915a1c0634a69c0fb'
	'9dffe0d0a187238b324182bf7fa86a077c9450c4'
	'0d82f9c3b731c157e52f014d3babd9871574d1d0'

	'b6da5c79576ba234ba595dde7b7792d164e3a147'
)

build() {
	mkdir -p $pkgdir/etc
	cp $startdir/slim.conf $pkgdir/etc/slim.conf.bundle-desktop
	mkdir -p $pkgdir/etc/X11/xinit || exit 1
	cp $startdir/xinitrc.local $pkgdir/etc/X11/xinit || exit 1
	cp $startdir/Xdefault.local $pkgdir/etc/X11/xinit || exit 1
	mkdir -p $pkgdir/etc/fonts/conf.{avail,d} || exit 1
	cp $startdir/45-restrict.conf $pkgdir/etc/fonts/conf.avail || exit 1
	ln -sf ../conf.avail/45-restrict.conf $pkgdir/etc/fonts/conf.d || exit 1
	mkdir -p "$pkgdir/usr/share/emerald/themes/Ambiance Emerald BW" || exit 1
	tar -zxf $startdir/Ambiance.Emerald.BW.emerald -C "$pkgdir/usr/share/emerald/themes/Ambiance Emerald BW" || exit 1
	bdir=/usr/share/bundle-desktop
	mkdir -p $pkgdir$bdir || exit 1
	cp $startdir/bundle-desktop-setup.sh $pkgdir$bdir || exit 1
	cp $startdir/starfield.png $pkgdir$bdir || exit 1
	cp $startdir/fusion-icon $pkgdir$bdir || exit 1
	cp $startdir/compiz.ini $pkgdir$bdir/compiz.ini || exit 1
	cp $startdir/gconf-panel.xml $pkgdir$bdir || exit 1
	cp $startdir/*.desktop $pkgdir$bdir || exit 1
	mkdir -p $pkgdir/pkg/usr/share/fonts/bundle-desktop
	cp $startdir/*.ttf $pkgdir/pkg/usr/share/fonts/bundle-desktop
}
