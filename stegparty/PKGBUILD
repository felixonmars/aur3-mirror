# Contributor: test0
pkgname=stegparty
pkgver=20140709
pkgrel=1
pkgdesc='StegParty is a system for hiding information inside of plain-text files. Unlike similar tools currently available it does not use random gibberish to encode data -- it relies on small alterations to the message, like changes to spelling and punctuation.'
arch=('any')
url='https://github.com/countrygeek/stegparty'
license=('GPL2')
makedepends=('git')
_gitroot="https://github.com/countrygeek/stegparty"
_gitname="stegparty"
build() {
   cd "$srcdir"
 msg "Connecting to GIT server...."
 if [ -d $_gitname ] ; then
   cd $_gitname && git pull origin
   msg "The local files are updated."
 else
   git clone --depth=1 $_gitroot $_gitname
   cd $_gitname
 fi
 msg "GIT checkout done or server timeout"
 cd "$srcdir/stegparty"
 rm stegparty
 make
}
package() {
	install -D -m755 "$srcdir/stegparty/stegparty" "${pkgdir}/usr/bin/stegparty"
	install -D -m644 "$srcdir/stegparty/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}