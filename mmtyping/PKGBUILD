# Maintainer: Marek Otahal <markotahal gmail>

pkgname=mmtyping
pkgver=2.0.8
pkgrel=1
pkgdesc="Master Mind touch typing tutor; all ten fingers, intelligent learning, about 5 times faster than any other way; layouts Latin, Dvorak, querty, ..."
arch=(any)
url="http://www.turnquist.org/"
license=(custom:freeware)
depends=('wine')
install=mmtyping.install
source=('http://www.turnquist.org/temporary/mm208.exe'
        'mmtyping.desktop' 'mmtyping')
sha1sums=('aca19b0348e9b5270bca573fe99a4ef4dcf05ade'
          '384c94b73fe6697badc45f9561c033575a60ad47'
          'd895abe2e905b8aa904cb3c1fb7268575d175a6b')

package() {
msg "installing $pkgname ..."
msg "you MUST install to the /tmp directory for this installer to work"
msg "package will later be installed to normal location, this is just a workaround"
msg "don't worry about any error, also un-installation select ok"
msg "read this and press any key to continue the installation"
read a
cd $srcdir
wine mm208.exe
cp -a /tmp/{Binary,Docs} $srcdir
wine /tmp/Uninstall.exe
rm /tmp/Uninstall.exe

cd $srcdir

install -m755 -d ${pkgdir}/usr/bin
install -m755 -d $pkgdir/usr/share/doc/$pkgname
install -m755 -d $pkgdir/usr/share/licenses/$pkgname
install -m755 -d $pkgdir/usr/share/$pkgname
install -m755 -d $pkgdir/usr/share/applications
install -m755 -d $pkgdir/usr/share/icons

install -m755 $pkgname ${pkgdir}/usr/bin
mv $srcdir/{Binary,Docs} $pkgdir/usr/share/$pkgname/
ln -s /usr/share/$pkgname/Docs/License.rtf $pkgdir/usr/share/licenses/$pkgname/License.rtf
ln -s /usr/share/$pkgname/Docs $pkgdir/usr/share/doc/$pkgname
ln -s /usr/share/$pkgname/Binary/Keyboard.ico $pkgdir/usr/share/icons/mmtyping.ico
install -m644 $srcdir/mmtyping.desktop $pkgdir/usr/share/applications/
msg "done"
}

# vim:set ts=2 sw=2 et:
