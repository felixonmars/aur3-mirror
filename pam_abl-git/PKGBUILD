## Contributor: buergi -- contact via Arch Linux forum or AUR

pkgname=pam_abl-git
pkgver=20121221
pkgrel=1
pkgdesc="Automated blacklisting on repeated failed authentication attempts"
arch=('i686' 'x86_64')
url="http://pam-abl.sourceforge.net/"
license=('GPL')
conflicts=(pam_abl)
replaces=(pam_abl)
provides=(pam_abl)
depends=(db pam)
makedepends=(asciidoc cmake)
install="pam_abl.install"

_gitroot="git://pam-abl.git.sourceforge.net/gitroot/pam-abl/pam-abl"
_gitname="pam-abl"

build() {
    cd "${srcdir}"
    msg "Connecting to GIT server...."

    if [ -d "${_gitname}" ] ; then
      cd "${_gitname}" && git pull --rebase origin
      msg "The local files are updated."
    else
      git clone "${_gitroot}" "${_gitname}"
    fi

    if [ -d "$srcdir/$_gitname-build" ]; then
      rm -fr "$srcdir/$_gitname-build"
    fi

    cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
    cd "$srcdir/$_gitname-build"

    # configure
    cmake . -DCMAKE_INSTALL_PREFIX=/usr

    # build binaries
    make || return 1

    # generate documentation
    cd doc
    sh generate.sh
}

package() {
    cd "$srcdir/$_gitname-build"

    # install binaries
    make install DESTDIR="$pkgdir/"

    # install example configuration
    install --mode=0644 -D -- conf/pam_abl.conf \
            "$pkgdir/etc/security/pam_abl.conf.example"

    #install documentation
    install --mode=0644 -D -- doc/pam_abl.1 \
            "$pkgdir/usr/share/man/man1/pam_abl.1"
    install --mode=0644 -D -- doc/pam_abl.8 \
            "$pkgdir/usr/share/man/man8/pam_abl.8"
    install --mode=0644 -D -- doc/pam_abl.conf.5 \
            "$pkgdir/usr/share/man/man5/pam_abl.conf.5"
}
