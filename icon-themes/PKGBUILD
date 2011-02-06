pkgname=icon-themes
pkgver=2.6
pkgrel=1
pkgdesc="Nice icon themes for gnome"
url="http://art.gnome.org/themes/icon/"
depends=('gnome-icon-theme')
arch=('i686' 'x86_64')
license=('GPL' 'GPL3' 'LGPL' 'MPL' 'CC')
THEME_URL="http://ftp.acc.umu.se/pub/GNOME/teams/art.gnome.org/themes/icon/"
source=(${THEME_URL}ICON-BlankOn.tar.gz \
${THEME_URL}ICON-DroplineEtiquette.tar.bz2 \
${THEME_URL}ICON-DroplineNuovo.tar.bz2 \
${THEME_URL}ICON-EXperienceCrystal.tar.gz \
${THEME_URL}ICON-EXperience.tar.gz \
${THEME_URL}ICON-Gartoon.tar.gz \
${THEME_URL}ICON-Humility.tar.gz \
${THEME_URL}ICON-Iris.tar.bz2 \
${THEME_URL}ICON-JiniIconTheme.tar.gz \
${THEME_URL}ICON-KearonesComiconsLight.tar.gz \
${THEME_URL}ICON-KearonesIcons.tar.gz \
${THEME_URL}ICON-Kreski-Lines.tar.gz \
${THEME_URL}ICON-NerdyLines.tar.bz2 \
${THEME_URL}ICON-OpenWorld.tar.bz2 \
${THEME_URL}ICON-StillLifeBrushed.tar.gz \
${THEME_URL}ICON-StillLife.tar.bz2 \
${THEME_URL}ICON-Suede2.tar.bz2 \
${THEME_URL}ICON-TangoMateria.tar.gz \
${THEME_URL}ICON-UnofficialTango.tar.bz2 \
${THEME_URL}ICON-Yasis.tar.bz2 \
${THEME_URL}ICON-YASIS.tar.bz2 \
${THEME_URL}ICON-YattaBlues.tar.gz \
)


build() {
cd $startdir/src/
/bin/rm *.gz *.bz2

/bin/mkdir -p $startdir/pkg/usr/share/icons
/bin/cp -R * $startdir/pkg/usr/share/icons
}
md5sums=('6067c95b39f5e9eb2a8d6409fdce4992'
'1cc8232199208b01967f46ea4990b3de'
'bbb59aaa3bb41b350c97b018593b0123'
'd0a1a386346cb4882877bf38cbf353c8'
'6ebc9b01c87919e633b75c12dff91f54'
'19fd88682ad2f88ca85f7e0a904610fd'
'bae5bac2f75e48b4a20eb587c1494eb2'
'4c83b86155e5ab42eba458168eaca5c5'
'7d4329c69d08440db06cc29e79da9e58'
'08d3511d3b58cd5238494cd31e8bac4c'
'699b8d08c7102004c6dfad2986d6705b'
'39e8e3f00adc95e4d8ea799608a3b952'
'28c898e91f7ec3aa45ca629bfc0ea560'
'53de1ed8d9ffa3a850ce9bf288f784d2'
'd6d8d8c87bedd57396488aa5d89ad7a7'
'10299083eaad36ef082a2a7ec558b68d'
'8d7b255e69ded25847ad77b6ce00b7a1'
'bbacecc6b8f903fbbd2b8321bc36ab88'
'2e58c81020af0795629cd8914a72dce9'
'9dc3c24c1a7cd860e6a45cedffcd750c'
'514fbf2d4eea546b22b142f2aeb2e822'
'881106e896a37856586b4296c6246ea8')
