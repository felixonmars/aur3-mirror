# Maintainer: ssf <punx69 at gmx dot net>

pkgname=glare-theme-misc-svn
pkgver=r543
pkgrel=1
pkgdesc="Misc Glare themes(WinAMP 2.x Skin, Qt4/5 Kvantum themes, LXQt theme, Aurorae theme)"
arch=('any')
url="https://github.com/sixsixfive/Glare/tree/master/Glare-misc"
license=("CCPL:cc-by-sa-4.0")
depends=()
replaces=('kvantum-theme-glare' 'lxqt-theme-glare')
makedepends=('subversion' 'sed' 'bc' 'imagemagick' 'coreutils' 'findutils' 'gawk' 'grep')
optdepends=('qt5-style-kvantum-svn: Includes a Kvantum theme'
'qt4-style-kvantum-svn: Includes a Kvantum theme'
'lxqt-config: Includes a LXQt theme'
'qmmp: Includes a Qmmp skin'
'audacious: Includes an Audacious skin'
'kwin: Includes an Aurorae skin'
'gtk-theme-glare-svn: For additional themes (GTK+, Openbox, Xfwm etc.)'
'xfce-icon-theme-ivy-svn: The recommended X11 icon theme')
provides=("glare-theme-misc=${pkgver}")
_svntrunk=https://github.com/sixsixfive/Glare/trunk/Glare-misc
_svnmod="Glare-Misc"

pkgver() {
	svn log https://github.com/sixsixfive/Glare/trunk --config-dir "$srcdir"|awk 'NR==2 {print $1}'
}

build() {
	cd "$srcdir"
	msg "Connecting to SVN server...."
	if [ -d "$_svnmod/.svn" ]; then
		(
		cd "$_svnmod"
		svn status --config-dir "$srcdir" --no-ignore|grep -E '(^\?)|(^\I)|(^\M)'|sed -e 's/^. *//'|sed -e 's/\(.*\)/"\1"/'|xargs rm -drf
		svn up . --config-dir "$srcdir"
		)
	else
		svn co "$_svntrunk" --config-dir "$srcdir" "$_svnmod"
	fi
}

package() {
	cd "$srcdir"/"$_svnmod"
	mkdir -p "$pkgdir"/usr/share/themes/"$_svnmod"
	cp -R ./* "$pkgdir"/usr/share/themes/"$_svnmod"
	rm -drf "$pkgdir"/usr/share/themes/"$_svnmod"/.svn
	rm -f "$pkgdir"/usr/share/themes/"$_svnmod"/README.md
#kvantum
	mkdir -p "$pkgdir"/usr/share/Kvantum
	cd "$pkgdir"/usr/share/Kvantum
	ln -s ../themes/Glare-Misc/Kvantum/Glare
#kde colors
	mkdir -p "$pkgdir"/usr/share/apps/color-schemes
	cd "$pkgdir"/usr/share/apps/color-schemes
	ln -s ../../themes/Glare-Misc/kde-colorscheme/Glare.colors
#lxqt
	mkdir -p "$pkgdir"/usr/share/lxqt/themes
	cd "$pkgdir"/usr/share/lxqt/themes
	ln -s ../../themes/Glare-Misc/lxqt/Glare
#qmmp
	mkdir -p "$pkgdir"/usr/share/qmmp/skins
	#qmmp can't read symlinks...
	cp "$pkgdir"/usr/share/themes/Glare-Misc/winamp2.x/Glare-qmmp.wsz "$pkgdir"/usr/share/qmmp/skins/Glare.wsz
#audacious
	mkdir -p "$pkgdir"/usr/share/audacious/Skins
	cd "$pkgdir"/usr/share/audacious/Skins
	ln -s ../../themes/Glare-Misc/winamp2.x/Glare.wsz
#mozilla
	mkdir -p "$pkgdir"/usr/share/mozilla/extensions
	cd "$pkgdir"/usr/share/mozilla/extensions
	mkdir {ec8030f7-c20a-464f-9b0e-13a3a9e97384}
	cd {ec8030f7-c20a-464f-9b0e-13a3a9e97384}
	ln -s ../../../themes/Glare-Misc/mozilla/glarebold GlareBold@ssfgh.com
	mkdir ../{92650c4d-4b8e-4d2a-b7eb-24ecf4f6b63a}
	cd ../{92650c4d-4b8e-4d2a-b7eb-24ecf4f6b63a}
	ln -s ../../../themes/Glare-Misc/mozilla/glarebold GlareBold@ssfgh.com
	mkdir ../{3550f703-e582-4d05-9a08-453d09bdfdc6}
	cd ../{3550f703-e582-4d05-9a08-453d09bdfdc6}
	ln -s ../../../themes/Glare-Misc/mozilla/glarebold GlareBold@ssfgh.com
#walls
	mkdir -p "$pkgdir"/usr/share/backgrounds
	cd "$pkgdir"/usr/share/backgrounds
	ln -s ../themes/Glare-Misc/wppatterns/Glare_pattern_dark-01.png
	ln -s ../themes/Glare-Misc/wppatterns/Glare_pattern_trans-01.png
	mkdir -p "$pkgdir"/usr/share/wallpapers
	cd "$pkgdir"/usr/share/wallpapers
	ln -s ../themes/Glare-Misc/wppatterns/Glare_pattern_dark-01.png
	ln -s ../themes/Glare-Misc/wppatterns/Glare_pattern_dark-01.png.desktop
#aurorae
	mkdir -p "$pkgdir"/usr/share/apps/aurorae/themes
	cd "$pkgdir"/usr/share/apps/aurorae/themes
	ln -s ../../../themes/Glare-Misc/Aurorae/Glare
#colorchange
	cd "$pkgdir"/usr/share/themes/Glare-Misc
	printf "Would you like to change the highlight/selection color now?: [y/N] \n"
	read input
	case $input in
		[yY])
			printf "executing color script.\n"
			./changecolor.sh;;
		*)
			printf "skipped\n";;
	esac
}
