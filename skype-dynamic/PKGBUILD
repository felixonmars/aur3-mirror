# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: m039 <m0391n (at) gmail (dot) com>

pkgname=skype-dynamic
pkgver="2.2.0"
pkgrel=1
pkgdesc="Skype dynamic binary file from the skype.com. Warning: This PKGBUILD doesn't check the md5 hash sum!"
url="http://www.skype.com/intl/en-us/get-skype/on-your-computer/linux/"
arch=('x86_64' 'i686')          # I didn't test it on i686
license=('custom')

depends=('qt>=4.4.3' 'libxss' 'libxv' 'fontconfig' 'pcre' 'glib2')
makedepends=('wget' 'tar' 'bzip2')

# The dynamic file will be downloaded dynamically
source=("fake")
md5sums=('d41d8cd98f00b204e9800998ecf8427e')

provides=('skype')
conflicts=('bin32-skype-oss' 'skype' 'skype-staticqt')

build() {
  cd $srcdir

  if [ ! -e $pkgname.tar.bz2 ]; then
    wget "http://www.skype.com/go/getskype-linux-beta-dynamic" -O $pkgname.tar.bz2
  fi
  
  mkdir -p $pkgdir/opt/$pkgname
  mkdir -p $pkgdir/usr/bin

  tar -xjf $pkgname.tar.bz2 --strip-components=1 -C $pkgdir/opt/$pkgname

cat > $pkgdir/usr/bin/skype  << EOF   
#!/bin/sh
#--------
/opt/$pkgname/skype --resources=/opt/$pkgname \$@
EOF

  chmod +x $pkgdir/usr/bin/skype
}
