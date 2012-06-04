# Maintainer: skydrome <irc.freenode.net>

pkgname=rutorrent-plugins-svn
pkgver=1967
pkgrel=1
pkgdesc="Plugins for ruTorrent"
arch=('any')
url="http://code.google.com/p/rutorrent"
license=('GPL')
depends=('rutorrent-svn' 'curl' )
makedepends=('subversion')
optdepends=('mktorrent: to create torrent files with mktorrent'
            'buildtorrent: to create torrent files with buildtorrent'
            'transmission-cli: to create torrent files with transmission'
            'php-geoip: to enable geoip plugin'
            'geoip: enable geoip plugin'
            'unrar: enable unpack plugin'
            'unzip: enable unpack plugin')
provides=('rutorrent-plugins')
conflicts=('rutorrent-plugins')
backup=()
options=(!strip emptydirs)
install=rutorrent-plugins-svn.install
source=('plugins.ini')
md5sums=('25a215875d47f7ec2cc0d32f6776031a')

_svntrunk="http://rutorrent.googlecode.com/svn/trunk/"
_svnmod="plugins"
_web="srv/http"
_webuser="http:http"

build() {
cd "$srcdir"

    msg "Connecting to SVN server..."
    [[ -d "$_svnmod/.svn" ]] &&
        svn up "$_svnmod" || svn co ${_svntrunk}/${_svnmod} --config-dir ./ "$_svnmod"
    msg "SVN checkout done or server timeout"

    # Uncomment to use the alternative dark theme
	#sed -i "s:\$defaultTheme .*:\$defaultTheme = \"Oblivion\";:" ${_svnmod}/theme/conf.php

    mkdir -p ${pkgdir}/${_web}/rutorrent/conf
    cp -r ${srcdir}/${_svnmod} ${pkgdir}/${_web}/rutorrent
    install -Dm755 'plugins.ini' "${pkgdir}/${_web}/rutorrent/conf/plugins.pacnew"
    chmod -R 755 "${pkgdir}/${_web}/rutorrent/${_svnmod}"
    chown -R ${_webuser} "${pkgdir}/${_web}/rutorrent/${_svnmod}"
}
