# Maintainer: Gabriel Fornaeus <gf@hax0r.se>
# Contributor: Gabriel Fornaeus <gf@hax0r.se>

pkgname=gcalcli-git
pkgver=20130415
pkgrel=1
pkgdesc="Allows you to access you Google Calendar from a command line, git version"
arch=('i686' 'x86_64')
url="https://github.com/insanum/gcalcli.git"
license=('MIT')
depends=('python2-dateutil' 'python2-httplib2'
'python2-google-api-python-client' 'python2-gdata')
optdepends=('python2-vobject: used for ics/vcal importing'
'python2-parsedatetime: used for fuzzy dates/times like "now",
"today", "eod tomorrow", etc.')
makedepends=('git')
makedepends=('git')
provides=('gcalcli')
conflicts=('gcalcli')

_gitroot="https://github.com/insanum/gcalcli.git"
_gitname="gcalcli-git"

build() {
    cd ${srcdir}

    msg "Connecting to GIT server..."
    if [[ -d ${_gitname} ]]; then
        (cd ${_gitname} && git pull origin)
    else
        git clone ${_gitroot} ${_gitname}
    fi
    msg "GIT checkout done or server timeout"
    msg "Starting build"
    cd ${_gitname}
    install -D -m755 gcalcli ${pkgdir}/usr/bin/gcalcli
}
