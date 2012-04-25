# Contributor: Ralf Mueller <stark.dreamdetective@gmail.com>
pkgname=ruby-netcdf
pkgver=0.6.6
pkgrel=0
pkgdesc="A Ruby interface to the NetCDF scientific IO library"
url="http://ruby.gfd-dennou.org/products/ruby-netcdf"
license=('Ruby')
depends=('ruby' 'netcdf')
makedepends=('ruby' 'netcdf')
provides=()
conflicts=()
replaces=()
arch=(i686 x86_64)
backup=()
install=
source=(${url}/${pkgname}-${pkgver}.tar.gz)
md5sums=('219e07f83e999a6409fe1dad395e2c3a')

build() {
  cd $srcdir/$pkgname-$pkgver
  narrayInstalled=$(echo $(gem list -i narray))
  if test 'true' = ${narrayInstalled}; then
    # check narray version number
    narrayFromGem=`gem list --versions narray`
    narrayVersion=`ruby -e "puts /\((.*)\)/.match('${narrayFromGem}')[1].split(',')[0]"`
    gemDir=`gem env gemdir`
    # expected dir of narray
    narrayDir=${gemDir}/gems/narray-${narrayVersion}
    echo ${narrayDir}
    echo ${narrayVersion}
    ruby extconf.rb --with-narray-include=${narrayDir} --with-narray-lib=${narrayDir}
    make || return 1
    make DESTDIR=$startdir/pkg site-install || return 1
  else
    echo "narray is NOT installed"
    echo "try to install it via rubygems ..."
    echo "sudo gem install -r narray"
    sudo gem install -r narray
    echo "... done"
    echo "If successfull, rerun makepkg"
    return 1
  fi
}
