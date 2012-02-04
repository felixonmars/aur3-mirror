# Maintainer : Wido <widomaker2k7@gmail.com>

pkgname=python2-wokkel-muc-hg
pkgver=101
pkgrel=2
pkgdesc="Twisted Jabber support library muc client support"
license=('custom:"Wokkel License"')
url="http://wokkel.ik.nu/"
source=()
arch=('any')
makedepends=('python2-distribute' 'mercurial')
depends=('twisted')
conflicts=(python-wokkel)

build() {
cd "$srcdir"
msg "Connecting to Mercurial server...."
hg clone http://hg.ik.nu/wokkel wokkel
    cd wokkel
    hg pull -f http://hg.ik.nu/ralphm/wokkel-muc-client-support-24-2
    hg merge wokkel-muc-client-support-24
    hg commit -u "SàT installation script" -m "Merged wokkel's MUC branch"
  msg "Mercurial clone done or server timeout"
  msg "Starting make..."

cd "$srcdir"/wokkel
 python2 setup.py install --prefix=/usr --root=$startdir/pkg --optimize=1
}
