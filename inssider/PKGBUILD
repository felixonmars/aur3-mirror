# Maintainer: Vladimir Chizhov <jagoterr@gmail.com>
pkgname=inssider
pkgver=0.1.1.0429
pkgrel=2
pkgdesc="Wi-Fi scanner"
arch=('i686' 'x86_64')
depends=('gtk-sharp-2' 'webkit-sharp' 'linux<3')
url="http://www.metageek.net/products/inssider/"
license=("Apache")
makedepends=('binutils')

if [ $CARCH == 'i686' ]; then
  source=("https://github.com/downloads/metageek-llc/inSSIDer-2-Cross-Platform/inssider_0.1.1.0429_i386.deb" 
          "https://github.com/downloads/metageek-llc/inSSIDer-2-Cross-Platform/inssider_patch_x86_for_0.1.1.0429.zip") 
  md5sums=('464efb218c919ba0a9db7c3f853e4cdf'
           '0a105705f15ab0897a82f1830d873115')
elif [ $CARCH == 'x86_64' ]; then
  source=("https://github.com/downloads/metageek-llc/inSSIDer-2-Cross-Platform/inssider_0.1.1.0429_amd64.deb"
          "https://github.com/downloads/metageek-llc/inSSIDer-2-Cross-Platform/inssider_patch_x64_for_0.1.1.0429.zip")
  md5sums=('df815433a33bf4f2b37e524b6076263a'
           '271040e4fa1ded4700f596e164a6af65')
fi

package() {
  cd $srcdir
  ar x ${pkgname}_0.1.1*
  tar xvf data.tar.gz
  cp -R usr $pkgdir
  cd ${pkgname}_patch_*
  cp MetaGeek.inSSIDer.LinuxManager.dll  $pkgdir/usr/share/inssider/Components/
  cp MetaGeek.inSSIDer.Extensions.NewsFeed.dll $pkgdir/usr/share/inssider/Extensions/
  mkdir $pkgdir/usr/bin
  cd  $pkgdir/usr/bin
  ln -s ../share/inssider/inssider.sh inssider
}

