# Contributors: William Díaz <wdiaz [at] archlinux [dot] us>
#        Mladen PejakoviÄ‡ <pejakm@gmail.com>
#		Thomas Jost (Schnouki) <thomas.jost@gmail.com>
#		Kaleb Elwert <vahki.ttc@gmail.com>

pkgname=slimrat-svn
pkgver=398
pkgrel=1
pkgdesc="Command line and GUI utility for downloading files from rapidshare.com (free), depositfiles.com, youtube.com and other sharing servers"
url="http://code.google.com/p/slimrat"
license=('MIT')
arch=('i686' 'x86_64')
depends=('perl' 'glade-perl' 'perl-www-mechanize' 'perl-json' 'perl-crypt-ssleay' 'perl-http-response-encoding' 'perl-spiffy' 'perl-json')
makedepends=('subversion')
optdepends=('aview or feh: for CAPTCHA support in command line'
            'tesseract:    for OCR solving'
            'xclip:        for clipboard support in GUI'
            'imagemagick:  for pass to ImageMagick convert binary')
backup=('etc/slimrat.conf')
conflicts=('slimrat')
provides=(slimrat=${pkgver})
install=slimrat.install
source=(slimrat.desktop)
md5sums=('c7c2e8aa2c145e1c66753bdff84aebdd')

_svntrunk=http://slimrat.googlecode.com/svn/trunk/
_svnmod=slimrat-svn

build() {
  cd ${srcdir}

  if [ -d ${_svnmod}/.svn ]; then
     (cd ${_svnmod} && svn up -r ${pkgver})
  else
     svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi

  install -d ${pkgdir}/usr/lib/ ${pkgdir}/usr/bin ${pkgdir}/etc
  cp -rb ${srcdir}/$_svnmod/src/ ${pkgdir}/usr/lib/slimrat/
  cp ${srcdir}/$_svnmod/slimrat.conf ${pkgdir}/etc/slimrat.conf
  install -D -m 644 ${srcdir}/slimrat.desktop ${pkgdir}/usr/share/applications/slimrat.desktop || return 1
  ln -s /usr/lib/slimrat/slimrat ${pkgdir}/usr/bin/slimrat
  ln -s /usr/lib/slimrat/slimrat-gui ${pkgdir}/usr/bin/slimrat-gui
}
