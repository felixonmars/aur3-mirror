python
import sys

sys.path.insert(0, '/usr/share/gdb/gdb-qt4-pretty')
from qt4.printers import register_qt4_printers
register_qt4_printers (None)

end
