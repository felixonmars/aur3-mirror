# Maintainer: Paul Burton <paulburton89@gmail.com>
# Based on python2-rethinkdb package:
#   Maintainer: RethinkDB Inc. <bugs@rethinkdb.com>
_base=rethinkdb
pkgname=python-${_base}
pkgver=1.12.0
pkgrel=1
pkgdesc="This package provides the Python driver library for the RethinkDB database server."
arch=('any')
url="http://rethinkdb.com"
license=('UNKNOWN')
groups=()
depends=('python' 'python-protobuf')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/r/${_base}/${_base}-${pkgver}-2.tar.gz")
md5sums=('7059c1f0df20d6c381039173b9f85a93')

prepare() {
  cd ${_base}-${pkgver}-2

  # fix up most of the python3 incompatibility
  find -name '*.py' | xargs 2to3 -w -n

  # docs.py is not python3 compatible, just scrap it for now...
  echo "import rethinkdb" >rethinkdb/docs.py

  # ql2_pb2.py fails trying to get a utf-8 empty string
  sed -i 's/str("", "utf-8")/""/' rethinkdb/ql2_pb2.py

  # SimpleQueue() requires a ctx argument as of python 3.4:
  #   http://bugs.python.org/issue21367
  sed -i 's/multiprocessing.queues.SimpleQueue()/multiprocessing.queues.SimpleQueue(multiprocessing.get_context())/' rethinkdb/_import.py
  sed -i 's/multiprocessing.queues.SimpleQueue()/multiprocessing.queues.SimpleQueue(multiprocessing.get_context())/' rethinkdb/_export.py
}

package() {
  cd ${_base}-${pkgver}-2

  PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION=cpp \
    python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
