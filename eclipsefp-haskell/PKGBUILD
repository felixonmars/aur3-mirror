# Contributor: Daniel Ehlers <danielehlers@mindeye.net>
pkgname="eclipsefp-haskell"
pkgver="0.10"
arch=('i686' 'x86_64')
license=('EPL')
pkgrel="1"
pkgdesc="Haskell, functional programming support for eclipse"
url="http://eclipsefp.sourceforge.net/"
depends=('eclipse>=3.2.1' 'ghc')
#source=("http://heanet.dl.sourceforge.net/project/eclipsefp/Haskell/0.10.0/site_net.sf.eclipsefp.haskell_.zip
source=("http://sourceforge.net/projects/eclipsefp/Haskell/0.10.0/site_net.sf.eclipsefp.haskell_${pkgver}.0.zip")
md5sums=('18523f57dbfec5337564da426515152e')

build() {
  install -d ${startdir}/pkg/opt/eclipse
  cd ${startdir}/pkg/opt/eclipse
  mv ${startdir}/src/plugins .
  mv ${startdir}/src/features .
  find ${startdir}/pkg/opt/eclipse -type d -exec chmod 755 {} \;
  find ${startdir}/pkg/opt/eclipse -type f -exec chmod 644 {} \;
}

