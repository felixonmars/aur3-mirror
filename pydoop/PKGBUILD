# Maintainer: Tianjiao Yin <ytj000@gmail.com>

pkgname=pydoop
pkgver=0.6.6
pkgrel=1
pkgdesc="A package that provides a Python API for Hadoop MapReduce and HDFS."
arch=('i686' 'x86_64')
license=('apache')
url="http://pydoop.sourceforge.net/docs/index.html"
depends=('python2' 'boost' 'openssl' 'hadoop')
source=("http://pypi.python.org/packages/source/p/pydoop/pydoop-0.6.6.tar.gz")
md5sums=('63d449511ebf6a59c0c5bc4fb9272197')

build() {

  export BOOST_PYTHON=boost_python
  #export HADOOP_HOME=/usr/lib/hadoop

  cd "$srcdir/$pkgname-$pkgver"

  # Python2 fix
  sed \
	-e "s_\(env python\).*_\12_" \
	-e "s_\(bin/python\).*_\12_" \
	-i `grep -rlE "(env python|bin/python)" .`

  python2 setup.py install --prefix=/usr --root="$pkgdir/"
}

