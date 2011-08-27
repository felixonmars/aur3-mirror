# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: rippero <ripperoso@gmail.com>

pkgname=youtranslate
pkgver=1.2.2
pkgrel=2
pkgdesc="A simple application for use Google Translate service in an easy and fast way"
arch=('any')
url="http://linux.softpedia.com/get/Utilities/YouTranslate-11031.shtml"
license=('GPL2')
depends=('mono' 'gtk-sharp-2' 'glib2' 'glade' 'libglade')
install=youtranslate.install
source=("http://slack.isper.sk/pub/slackware-13.0/office/youtranslate/1.2.2/src/${pkgname}_${pkgver}_bin.tar.gz"
        'youtranslate.desktop'
        'youtranslate.png')
md5sums=('e167bfbc6467a53642000b48e2496649'
         '618dcce4a80b186ab85586037dd8041a'
         'd6011579c943d6d98e6e1024b33c9c63')

package () {
 cd "$srcdir/${pkgname}_${pkgver}_bin"

 sed -i "s%\./%/usr/lib/$pkgname/%" "$pkgname"

 install -Dm755 "$pkgname.exe" "$pkgdir/usr/lib/$pkgname/$pkgname.exe"
 install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
 install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
 install -Dm644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
}
