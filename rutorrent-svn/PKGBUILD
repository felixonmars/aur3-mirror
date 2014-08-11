# Maintainer: skydrome <skydrome@i2pmail.org>
# Contributor: skydrome <skydrome@i2pmail.org>

#######################
#[ 3rd Party Plugins ]#
_pausewebui=1
#_ratiocolor=1
#_instantsearch=1
#_logoff=1
#_filemanager=1
#_fileshare=1
#_fileupload=1
#_mediastream=1
#_chat=1
#_titlebar=1
#_spectrogram=1
#######################

pkgname=('rutorrent-svn' 'rutorrent-plugins-svn')
pkgver=2475
pkgrel=1
arch=('any')
url="http://code.google.com/p/rutorrent"
license=('GPL')
makedepends=('subversion')
_svnmod=rutorrent
source=("${_svnmod}::svn+http://rutorrent.googlecode.com/svn/trunk"
        'plugins.ini')
md5sums=('SKIP'
         'a899903a6db2abe467e8f96d2c87d068')
options=(!strip)

[[ $_ratiocolor = 1 || $_titlebar = 1 ]] &&
    makedepends+=('git')

_webdir="usr/share/webapps"

pkgver() {
    cd "$SRCDEST/$_svnmod"
    svnversion |tr -d [A-z]
}

prepare() {
    cd "$srcdir/$_svnmod"

    sed -i rutorrent/conf/config.php \
        -e "s:\$topDirectory .*:\$topDirectory = '/home';:" \
        -e "s:\$XMLRPCMountPoint .*:\$XMLRPCMountPoint = \"/rutorrent/RPC1\";:" \
        -e "s:\$tempDirectory .*:\$tempDirectory = '/${_webdir}/rutorrent/tmp';:"
    sed -i rutorrent/php/settings.php \
        -e "s:'/tmp:'/${_webdir}/rutorrent/tmp/:"
}

build() {
    cd "$srcdir/$_svnmod/plugins"

    [[ $_pausewebui ]] &&
        svn co "https://rutorrent-pausewebui.googlecode.com/svn/trunk"      pausewebui
    [[ $_logoff ]] &&
        svn co "https://rutorrent-logoff.googlecode.com/svn/trunk"          logoff
    [[ $_instantsearch ]] &&
        svn co "https://rutorrent-instantsearch.googlecode.com/svn/trunk"   instantsearch
    [[ $_filemanager ]] &&
        svn co "http://svn.rutorrent.org/svn/filemanager/trunk/filemanager" filemanager
    [[ $_fileshare ]] &&
        svn co "http://svn.rutorrent.org/svn/filemanager/trunk/fileshare"   fileshare
    [[ $_fileupload ]] &&
        svn co "http://svn.rutorrent.org/svn/filemanager/trunk/fileupload"  fileupload
    [[ $_mediastream ]] &&
        svn co "http://svn.rutorrent.org/svn/filemanager/trunk/mediastream" mediastream
    [[ $_spectrogram ]] &&
        svn co "http://svn.rutorrent.org/svn/spectrogram/trunk"             spectrogram
    [[ $_chat ]] &&
        svn co "https://rutorrent-chat.googlecode.com/svn/trunk"            chat
    [[ $_ratiocolor ]] &&
        [[ ! -d "ratiocolor" ]] &&
            git clone --depth 1 "git://github.com/Gyran/rutorrent-ratiocolor.git" ratiocolor
    [[ $_titlebar ]] &&
        [[ ! -d "titlebar" ]] &&
            git clone --depth 1 "git://github.com/SanKen/rutorrent-titlebar.git"  titlebar

    curl -so filedrop/jquery.filedrop.js \
        https://raw.github.com/weixiyen/jquery-filedrop/master/jquery.filedrop.js
}

package_rutorrent-svn() {
    pkgdesc="Web frontend to rTorrent in PHP designed to resemble uTorrent"
    depends=('php')
    provides=('rutorrent')
    conflicts=('rutorrent')
    install=rutorrent.install
    backup=("${_webdir}/rutorrent/conf/config.php"
            "${_webdir}/rutorrent/conf/access.ini")

    cd "$srcdir/$_svnmod"
    install -dm755  "$pkgdir/$_webdir"
    cp -r rutorrent "$pkgdir/$_webdir"
    install -dm777  "$pkgdir/$_webdir/rutorrent/tmp"
    rm -r "$pkgdir/$_webdir"/rutorrent/{plugins,conf/plugins.ini}
}

package_rutorrent-plugins-svn() {
    pkgdesc="Plugins for ruTorrent"
    depends=('rutorrent-svn' 'curl')
    optdepends=('mktorrent: create torrent files with mktorrent'
                'buildtorrent: create torrent files with buildtorrent'
                'transmission-cli: create torrent files with transmission'
                'php-geoip: enable geoip plugin'
                'geoip: enable geoip plugin'
                'unrar: enable unpack plugin'
                'unzip: enable unpack plugin')
    install=rutorrent-plugins.install
    conflicts=('rutorrent-plugins')
    provides=('rutorrent-plugins')
    replaces=('rutorrent-plugins-svn')
    backup=("${_webdir}/rutorrent/conf/plugins.ini")

    cd "$srcdir/$_svnmod"
    install -dm755 "$pkgdir/$_webdir/rutorrent/conf"
    install -Dm755 $srcdir/plugins.ini "$pkgdir/$_webdir/rutorrent/conf/plugins.ini"
    cp -r plugins  "$pkgdir/$_webdir/rutorrent"
}
