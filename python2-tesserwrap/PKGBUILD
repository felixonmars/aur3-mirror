# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Maintainer: TonySeek <tonyseek at gmail dot com>

_pkgname=tesserwrap
pkgname=python2-$_pkgname
pkgver=0.0.13
pkgrel=1
pkgdesc="Basic python bindings to the Tesseract C++ API"
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/tesserwrap"
license=('Apache')
groups=()
depends=('python2' 'tesseract>=3.0')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://pypi.python.org/packages/source/t/tesserwrap/$_pkgname-$pkgver.tar.gz")
md5sums=('0b6dd4e8a6f24d9741de1a492b82e855')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
