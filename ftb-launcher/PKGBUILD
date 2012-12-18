# Maintainer: Jacob Litewski <hackhalo2 AT gmail DOT com>

pkgname=ftb-launcher
pkgver=latest
pkgrel=1
pkgdesc="Feed the Beast custom Minecraft Launcher"
arch=(any)
license=('custom')
url="http://feed-the-beast.com/"
depends=('java-runtime' 'xorg-server-utils' 'openal' 'ttf-dejavu' 'wget')
# Some are you are probabily wondering why I need wget as a dependancy
# Since the FTB launcher needs to update itself, and the directories are write protected (for a good reason),
# I needed a way to get the launcher into the $HOME directory of the user
# So, using 'wget' in the 'ftb-launcher-script', I check to make sure that $HOME/.ftb exists and create the directory if it doesn't
# Then check to see if $HOME/.ftb/FTB_Launcher.jar exists. If it doesn't, I pull it from feed-the-beast.com.
# It's also the reason why I don't have the jar as a source, it automatically pulls the latest version of the launcher.
# You can check out the source of the script on github to validate this, I would never do anything to harm anyones computer.
source=("ftb.desktop" "ftb.png" "https://gist.github.com/raw/4330506/557738b0a249bc1b581556feb803d9d804910641/ftb-launcher-script.sh" "feedthebeast.install")
md5sums=("415a2ea103ebc1023714296be8f89ad7"
	 "0d087d4fe25df9a91aa8af057e9ece39"
	 "d764e74c5f612a88caadc9a7b4a7a721"
	 "5953ed02139bc3d2a76de694b80e9080")
install="feedthebeast.install"

package() {
	cd $srcdir

	# Install the script
	install -D -m755 "${srcdir}/ftb-launcher-script.sh"	"${pkgdir}/usr/bin/ftb-launcher-script.sh"

	# Install the Desktop stuff
	install -D -m644 "${srcdir}/ftb.desktop"		"${pkgdir}/usr/share/applications/ftb.desktop"
	install -D -m644 "${srcdir}/ftb.png"			"${pkgdir}/usr/share/pixmaps/ftb.png"
}
