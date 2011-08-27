# Maintainer: J. Berger <jeberger@free.fr>
pkgname=bitten-svn
pkgver=987
pkgrel=1
pkgdesc="A continuous integration plugin for Trac"
arch=(i686 x86_64)
url="http://bitten.edgewall.org"
license="BSD"
depends="trac>=0.11"
patches=('bitten-cunit.patch' 'bitten-cunit-traceback.patch' 'bitten-cppcheck.patch' 'bitten-errorsasfailures.patch')
source=("${patches[@]}" "bitten-slave")
md5sums=('56c5c7694c845f99c6cd65dd086467f6'
         '3ace395a188d8e5bfe6919a799707705'
         'f7c7689e448d9308b0e7316918055a57'
         'a82ca5a71fe32a34f92aeee2740c60d0'
         '17425458fc6b00e51abfbc75b6ee0fc0')

_svntrunk=http://svn.edgewall.org/repos/bitten/trunk/
_svnmod=bitten

build() {
   cd "$srcdir"

   msg "Preparing the sources"

   if [ -d "$_svnmod/.svn" ]; then
      svn up "$_svnmod" -r "$pkgver" || return 1

      warning "Local patches were not re-applied!"
   else
      svn co "$_svntrunk" -r "$pkgver" "$_svnmod" || return 1

      msg "Applying patches"
      cd "$_svnmod"
      for p in ${patches[@]}; do
         patch -p1 < "$startdir/$p" || return 1
      done
   fi

   cd "$srcdir/$_svnmod"
   msg "Building the Python Egg"
   python2 setup.py bdist_egg || return 1

   msg "Installing"
   PY_VERSION=$(python2 -c 'import distutils.sysconfig as cfg; print cfg.get_config_var ("VERSION")')
   python2 setup.py install --root="$startdir/pkg" || return 1

   install -Dm 644 "dist/Bitten-0.7dev_r${pkgver}-py${PY_VERSION}.egg" "$startdir/pkg/usr/lib/bitten/Bitten-r$pkgver-$pkgrel.egg"
   install -Dm 755 "$srcdir/bitten-slave" "$pkgdir/etc/rc.d/bitten-slave"
}
