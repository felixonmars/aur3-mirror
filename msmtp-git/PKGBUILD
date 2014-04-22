# Maintainer: Mark Foxwell <mark@openfox.co.uk>
# Contributor: Jerome Leclanche <jerome.leclanche+arch@gmail.com>
# Contributor: Mark Foxwell <fastfret79@archlinux.org.uk>
# Contributor: Andres P <aepd87@gmail.com>

pkgname=msmtp-git
pkgver=1.4.32.r1.gae3d564
pkgrel=1
pkgdesc="A mini smtp client (git version)"
arch=(i686 x86_64)
url="http://msmtp.sourceforge.net"
license=('GPL3')
provides=('msmtp' 'smtp-forwarder')
conflicts=('msmtp')
depends=('gsasl' 'libgnome-keyring')
makedepends=('git' 'texlive-plainextra' 'gsasl' 'libgnome-keyring')
install=msmtp.install
source=("git://git.code.sf.net/p/msmtp/code")
md5sums=('SKIP')
_gitdir="code"

pkgver() {
    cd "$srcdir/$_gitdir"
    git describe --long | sed -r 's/^rel.//;s/([^-]*-g)/r\1/;s/-/./g'
}


build() {

    cd "$srcdir/$_gitdir"
    sed -i 's|/usr/bin/python|/usr/bin/python2|' scripts/msmtp-gnome-tool/msmtp-gnome-tool.py

    cd "$srcdir/$_gitdir"
    autoreconf -i
    ./configure --prefix=/usr --sysconfdir=/etc --with-ssl=gnutls
    make
    make -C doc html pdf

}

package() {
	cd "$srcdir/$_gitdir"

    make DESTDIR="${pkgdir}" install 
    make DESTDIR="${pkgdir}" -C doc install-html install-pdf

    # Installing example configs and scripts to /usr/share/doc/msmtp
    # as they are not installed by default (Debian and Gentoo do it this way)
    install -d "${pkgdir}/usr/share/doc/msmtp"
    cp -r scripts/{find_alias,msmtp-gnome-tool,msmtpqueue,msmtpq,set_sendmail} "${pkgdir}/usr/share/doc/msmtp/"
    install -D -m644 doc/*.example "${pkgdir}/usr/share/doc/msmtp/"
    install -D -m644 scripts/vim/msmtp.vim "${pkgdir}/usr/share/vim/vimfiles/syntax/msmtp.vim"

}
