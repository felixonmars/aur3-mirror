# Contributor: Fernando Henrique <arch at liquuid dot net> 
# Contributor: Nathan Owe <ndowens04+AUR at gmail.com>
# Maintainer: Uwe Hermann <keksvernichter at gmail.com>
# Maintainer: Nathan Owe <ndowens.aur at gmail dot com>
# Maintainer: Lucas Salies Brum <sistematico at gmail dot com>

pkgname=gtwitter
pkgver=1.0
_pkgver1=1.0beta
_pkgver2=1.0~beta
pkgrel=4
pkgdesc="A Linux client for reading and posting to twitter.com web service."
arch=('i686' 'x86_64')
url="http://code.google.com/p/gtwitter/"
license=('GPL')
depends=('mono' 'cairo' 'gtk-sharp-2' 'gnome-sharp' 'libsexy' 'gtk')
source=("http://launchpad.net/${pkgname}/trunk/${_pkgver1}/+download/${pkgname}_${_pkgver2}.orig.tar.gz" 
		"${pkgname}.desktop")
md5sums=('e75edd00168c8edca603cfc842e07b99'
         '9411cd375e795914a7d395f426e5fe43')

build() {
  cd ${srcdir}/${pkgname}-$_pkgver1
  sed -i 's|Gnome.Url.Show ("http://twitter.com/signup");||' gtwitter/PreferencesWindow.cs
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${_pkgver1}
  install -d ${pkgdir}/usr/{bin,lib/${pkgname},share/{applications,pixmaps}}
  make DESTDIR=${pkgdir} install
  install -Dm644 data/gtwitter-48.png ${pkgdir}/usr/share/pixmaps/gtwitter.png
  install -Dm644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
