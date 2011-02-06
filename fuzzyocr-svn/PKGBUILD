# Contributor: filip <fila pruda com>
pkgname=fuzzyocr-svn
pkgver=142
pkgrel=1
pkgdesc="plugin for SpamAssassin which scans images"
arch=(i686 x86_64)
url="http://fuzzyocr.own-hero.net"
backup=(etc/mail/spamassassin/FuzzyOcr.cf)
license=('APACHE')
depends=('netpbm' 'gifsicle' 'giflib' 'ocrad' 'gocr' 'perl-string-approx' 'perl-time-hires' 'spamassassin')
makedepends=('svn')
optdepends=('perl-mldbm-sync: to use image hashing' 'tesseract: scan TIFF images')
source=()
md5sums=()

_svntrunk=https://svn.own-hero.net/fuzzyocr/trunk/devel
_svnmod=fuzzyocr

build() {
  cd ${srcdir}

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting ant build process..."

  cp -a ${srcdir}/${_svnmod} ${srcdir}/${_svnmod}-build
  cd ${srcdir}/${_svnmod}-build

  install -d ${pkgdir}/etc/mail/spamassassin
  
  install -D -m644 ${srcdir}/${_svnmod}-build/FuzzyOcr.cf ${pkgdir}/etc/mail/spamassassin/
  install -D -m644 ${srcdir}/${_svnmod}-build/FuzzyOcr.scansets ${pkgdir}/etc/mail/spamassassin/
  install -D -m644 ${srcdir}/${_svnmod}-build/FuzzyOcr.preps ${pkgdir}/etc/mail/spamassassin/
  install -D -m644 ${srcdir}/${_svnmod}-build/FuzzyOcr.pm ${pkgdir}/etc/mail/spamassassin/
  install -D -m644 ${srcdir}/${_svnmod}-build/FuzzyOcr.words ${pkgdir}/etc/mail/spamassassin/
  
  install -d ${pkgdir}/etc/mail/spamassassin/FuzzyOcr/
  install -D -m644 ${srcdir}/${_svnmod}-build/FuzzyOcr/* ${pkgdir}/etc/mail/spamassassin/FuzzyOcr/
 
  rm -rf ${srcdir}/${_svnmod}-build

}
