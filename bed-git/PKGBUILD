# Mantainer: Mauro Andreolini <mauro.andreolini@unimore.it>
pkgname=bed-git
pkgver=20130307
pkgrel=2
pkgdesc="Check daemons for potential buffer overflows and format string bugs"
arch=('any')
url="https://github.com/wireghoul/bed"
license=('GPL2')
depends=('perl')
makedepends=('git')
conflicts=('bed')
install=
source=()
noextract=()
md5sums=()

_gitroot="https://github.com/wireghoul/bed.git"
_gitname="bed"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d ${_gitname}/.git ] ; then
    cd ${_gitname}

    # Change remote url to anongit
    if [ -z $( git branch -v | grep anongit ) ] ; then
      git remote set-url origin ${_gitroot}
    fi

    git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${_gitname}
  fi
}

package(){
  cd ${srcdir}/${_gitname}
  install -D -m755 bed.pl ${pkgdir}/usr/bin/bed.pl
  install -D -m644 bedmod/finger.pm ${pkgdir}/usr/lib/perl5/vendor_perl/bedmod/finger.pm
  install -D -m644 bedmod/ftp.pm ${pkgdir}/usr/lib/perl5/vendor_perl/bedmod/ftp.pm
  install -D -m644 bedmod/http.pm ${pkgdir}/usr/lib/perl5/vendor_perl/bedmod/http.pm
  install -D -m644 bedmod/imap.pm ${pkgdir}/usr/lib/perl5/vendor_perl/bedmod/imap.pm
  install -D -m644 bedmod/irc.pm ${pkgdir}/usr/lib/perl5/vendor_perl/bedmod/irc.pm
  install -D -m644 bedmod/lpd.pm ${pkgdir}/usr/lib/perl5/vendor_perl/bedmod/lpd.pm
  install -D -m644 bedmod/pjl.pm ${pkgdir}/usr/lib/perl5/vendor_perl/bedmod/pjl.pm
  install -D -m644 bedmod/pop.pm ${pkgdir}/usr/lib/perl5/vendor_perl/bedmod/pop.pm
  install -D -m644 bedmod/rtsp.pm ${pkgdir}/usr/lib/perl5/vendor_perl/bedmod/rtsp.pm
  install -D -m644 bedmod/smtp.pm ${pkgdir}/usr/lib/perl5/vendor_perl/bedmod/smtp.pm
  install -D -m644 bedmod/socks4.pm ${pkgdir}/usr/lib/perl5/vendor_perl/bedmod/socks4.pm
  install -D -m644 bedmod/socks5.pm ${pkgdir}/usr/lib/perl5/vendor_perl/bedmod/socks5.pm
  install -D -m644 bedmod/tftp.pm ${pkgdir}/usr/lib/perl5/vendor_perl/bedmod/tftp.pm
  install -D -m644 bedmod/whois.pm ${pkgdir}/usr/lib/perl5/vendor_perl/bedmod/whois.pm
}

# vim:set ts=2 sw=2 et:
