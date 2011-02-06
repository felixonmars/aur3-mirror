# Contributor: Matthias Küch mail<ät>matthias-kuech<döt>de
# Maintainer: Matthias Küch mail<ät>matthias-kuech<döt>de
# The following PKGBUILD is mainly borrowed by tvbrowser and merkaartor-svn
pkgname=tvbrowser-svn
pkgver=6003
pkgrel=1
pkgdesc="A java-based TV guide which is easily extensible using plugins - SVN Version"
arch=('i686' 'x86_64')
url="http://www.tvbrowser.org"
license=('GPL' 'LGPL' 'BSD' 'CCPL:by-sa' 'APACHE')
makedepens=('subversion', 'ant')
depends=('java-runtime' 'x-server')

_svntrunk='https://tvbrowser.svn.sourceforge.net/svnroot/tvbrowser/trunk/tvbrowser'
_svnmod=$pkgname
build() {

cd $srcdir

  if [ -d $_svnmod/.svn ]; then
     (cd $_svnmod && svn up -r $pkgver)
   else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
     
       msg "SVN checkout done or server timeout"
       msg "Starting ant..."

       cd $_svnmod

       ant runtime; 

       # I've uncommented some installtion steps from the original tvbrowser PKGBUILD since they have not worked the first time. These are mainly
       # steps for desktop integration. Feel free to commit your progress.
       
   # Removing delivered desktop entry and shell script.
   # rm $srcdir/tvbrowser-svn/$pkgname.{sh,desktop}

  install -d -m755 $pkgdir/usr/share/java
  cp -R $srcdir/$pkgname/runtime/tvbrowser_default $pkgdir/usr/share/java/$pkgname

  # Installing the official scalable logo, which can/will be used by modern window managers / desktop environments that support SVG.
  #  install -D -m644 $srcdir/${pkgname}_logo.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg

   cd $srcdir
   cd ../

  install -D -m755 $pkgname.sh $pkgdir/usr/bin/$pkgname
  install -D -m644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

  # Installing the complete bundle of copyright notices. At least because of the BSD license part this step is necessary (http://wiki.archlinux.org/index.php/Arch_Packaging_Standards#Licenses)
  install -D -m644 $srcdir/$pkgname/runtime/tvbrowser_default/COPYRIGHT.txt $pkgdir/usr/share/licenses/$pkgname/COPYRIGHT.txt

  # For window managers that don't support SVG (yet) (like e.g. fluxbox), we can also install the set of icons as delivered by the tvbrowser package.
  #  for _i in 16 32 48 128; do
  #    install -D -m644 $srcdir/$pkgname-$pkgver/imgs/${pkgname}${_i}.png $pkgdir/usr/share/icons/hicolor/${_i}x${_i}/apps/$pkgname.png
  #  done
}

