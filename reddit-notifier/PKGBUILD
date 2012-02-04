# Contributor: Wido <widomaker2k7@gmail.com>

pkgname=reddit-notifier
pkgver=0.40
pkgrel=1
pkgdesc="A desktop app that notifies you of new comments on your submissions, new messages, new votes on your comments/submissions etc."
arch=('i686' 'x86_64')
url="http://code.google.com/p/reddit-notifier/"
license=('GPL')
depends=('adobe-air')
makedepends=('unzip')
source=(http://reddit-notifier.googlecode.com/files/Reddit-Notifier-$pkgver.air $pkgname.sh $pkgname.desktop)

build()
{
   cd ${srcdir}/

   install -m644 -D ${srcdir}/img/alien128.png ${startdir}/pkg/usr/share/pixmaps/$pkgname.png
   install -m644 -D ${srcdir}/Reddit-Notifier-$pkgver.air ${startdir}/pkg/opt/$pkgname/$pkgname.air
   install -m755 -D ${srcdir}/$pkgname.sh ${startdir}/pkg/usr/bin/$pkgname
   install -m644 -D ${srcdir}/$pkgname.desktop ${startdir}/pkg/usr/share/applications/$pkgname.desktop
}
md5sums=('e7eb65a5a32f93bd3a71a4625c3cfa2b'
         'b712cbbcdd436c39d65f72d8b53a1318'
         'df2afec1258dd2bfb970683912fe0faf')
