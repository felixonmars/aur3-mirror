# Contributor: fhtagn <mynameismypassportverifyme (at) Gmail (dot) com>

basename=vlc
extname=subtitles-mod
realname=subtitles-mod
pkgname=${basename}-${extname}
pkgver=1.04
pkgrel=1
pkgdesc="Get the subtitles of movies from the internet, currently only from OpenSubtitles.org"
vlcaddnum=141787
arch=("any")
url="http://addons.videolan.org/content/show.php?content=141787"
license=("GPL3")
depends=("${basename}" lua)
options=(!emptydirs)

source=(http://addons.videolan.org/CONTENT/content-files/${vlcaddnum}-${realname}.lua)

package() {
    cd "${srcdir}"
    
    install -D ${vlcaddnum}-${realname}.lua ${pkgdir}/usr/lib/${basename}/lua/extensions/${realname}.lua
}

sha1sums=('ed0fab23b4f1441bdc8bce7a03f38dbe2a6876a4')