# Contributor: Marcelo Cavalcante - kalib <kalib@archlinux-br.org>
# Contributor: Babets

pkgname=amsn-plugins-gnotify
pkgver=r11095
pkgrel=1
pkgdesc="Amsn plugin to check Gmail accounts in aMSN and notify you with the email information. A kind of \"Gmail Notifer\" clone for aMSN."
depends=('amsn')
arch=('i686' 'x86_64')
conflicts=('amsn-extras-svn')
license=('GPL')
groups=('amsn-plugins')
url="http://amsn.sourceforge.net"
_pluginname="gnotify"
source=(http://downloads.sourceforge.net/amsn/$_pluginname-$pkgver.zip)
md5sums=('b237690508977a96d0f1e73385c108d2')


build() {
cd $startdir/src/$_pluginname

# Create destination directory
install -d ${pkgdir}/usr/share/amsn/plugins/$_pluginname
install -d ${pkgdir}/usr/share/amsn/plugins/$_pluginname/{lang,pixmaps}

# Move lang files
install -m 0644 $startdir/src/$_pluginname/lang/{langen,langes,langfr,langhu,langlt} \
${pkgdir}/usr/share/amsn/plugins/$_pluginname/lang/

# Move pixmaps files
install -m 0644 $startdir/src/$_pluginname/pixmaps/{gnotify_empty,gnotify_error,gnotify_new,paperclip,star}.png \
${pkgdir}/usr/share/amsn/plugins/$_pluginname/pixmaps/

# Move .tcl and xml file
install -m 0644 $startdir/src/$_pluginname/{plugininfo.xml,$_pluginname.tcl} ${pkgdir}/usr/share/amsn/plugins/$_pluginname/
}
