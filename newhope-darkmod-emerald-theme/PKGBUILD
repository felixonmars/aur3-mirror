# Maintainer: Malina <mali@irc>
#yesh, I bASH like a true canary wizard witch warlock thingy.

pkgname=newhope-darkmod-emerald-theme
pkgver=0.1
pkgrel=1
pkgdesc="A New Hope Dark Mod Beryl/Emerald Theme"
url="http://beryl-themes.org/content/show.php/A+New+Hope+Dark+Mod?content=142322"
license=('cc-nc-sa')
arch=('any')
depends=('emerald')
source=("http://beryl-themes.org/CONTENT/content-files/142322-A-New-Hope-Dark-Mod.emerald")
DLAGENTS=('http::/usr/bin/wget -c -t 3 --waitretry=3 -H -U Mozilla -O %o %u')

package() {
#Let's not have the archive number incl. in theme name:
for fname in *.emerald; do mv "$fname" "${fname#*-}"; done
	cd ${srcdir}
# Author noticed a bug where sometimes fullscreen/windowed would lose buttons.
# He proposes to remove the shade button:
 sed "s/SNRC/NRC/" -i theme.ini
    for file in *emerald ; do 
		mkdir -p ${pkgdir}/usr/share/emerald/themes/"${file/.emerald/}"
		bsdtar -x -f "${file}" -C ${pkgdir}/usr/share/emerald/themes/"${file/.emerald/}"
	done
}
md5sums=('492e2679f366b65f195b7afe6c35f9aa')
