# Maintainer: Manuel Fill <ap0calypse@agitatio.org>
pkgname=jarvis-git
pkgver=20121121
pkgrel=1
pkgdesc="monitoring tool - just another really versatile information system"
arch=('any')
url="http://github.com/ap0calypse/jarvis"
license=('MIT')
depends=('sqlite3' 'perl-dbd-sqlite' 'perl-proc-processtable' 'perl-filesys-df' 'perl-file-tail' 'hddtemp' 'lm_sensors' 'texlive-bin')
makedepends=('git')
provides=('jarvis')

_gitroot="https://github.com/ap0calypse/jarvis.git"
_gitname="jarvis"

build() {
    cd "$srcdir"
        msg "Connecting to GIT server...."

        if [ -d $_gitname ] ; then
            cd $_gitname && git pull origin
                msg "The local files are updated."
        else
            git clone $_gitroot $_gitname
                fi

                msg "GIT checkout done or server timeout"
                msg "Starting make..."
                rm -rf "$srcdir/$_gitname-build"
                git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
}

package() {
    cd "$srcdir/$_gitname-build"
    getent passwd jarvis > /dev/null 2>&1 || useradd -g users -d /opt/jarvis -s /bin/bash -c JarvisUser jarvis 2> /dev/null;
    mkdir -p "${pkgdir}/opt/jarvis/agents" 2> /dev/null;
    mkdir -p "${pkgdir}/opt/jarvis/doc" 2> /dev/null;
    
    install -D -m755 jarvis "${pkgdir}/opt/jarvis/jarvis"
    install -D -m755 jarvis_report "${pkgdir}/opt/jarvis/jarvis_report"
    install -D -m644 example-config "${pkgdir}/opt/jarvis/jarvis.conf"
    cp agents/* "${pkgdir}/opt/jarvis/agents/"
    cp doc/* "${pkgdir}/opt/jarvis/doc/"
    install -D -m644 README.md "${pkgdir}/opt/jarvis/README.md"
    install -D -m644 AUTHORS "${pkgdir}/opt/jarvis/AUTHORS"
    if [[ ! -e "/opt/jarvis/jarvis.db" ]] ; then
        
        sqlite3 "${pkgdir}/opt/jarvis/jarvis.db" "CREATE TABLE events (ev_id integer primary key, id text, name text, typ text, status integer, message text, datum datetime);"
        sqlite3 "${pkgdir}/opt/jarvis/jarvis.db" "CREATE TABLE triggers (tr_id integer primary key, tr_name text, datum datetime);" 
    else 
        cp /opt/jarvis/jarvis.db "${pkgdir}/opt/jarvis/jarvis.db"
        rm /opt/jarvis/jarvis.db
    fi
    chown -R jarvis:users "${pkgdir}/opt/jarvis" > /dev/null
} 
